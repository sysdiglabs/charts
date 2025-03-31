import os
import re
import requests
from urllib.parse import urljoin
from concurrent.futures import ThreadPoolExecutor, as_completed
from tqdm import tqdm

DOCS_BASE = "https://docs.sysdig.com"
LINK_PATTERN = re.compile(r'https?://docs\.sysdig\.com(/[^\s\'"<>]+)')
MAX_WORKERS = 10
EXCLUDE_DIRS = {'node_modules', 'dist', 'build', '.git', 'vendor'}

def find_links_in_repo(repo_path=None):
    """Find all docs.sysdig.com links with progress tracking"""
    if repo_path is None:
        # Go up two levels from current directory to reach the root
        repo_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../'))
    
    links = set()
    supported_extensions = ('.html', '.js', '.jsx', '.ts', '.tsx', '.py', '.yaml')
    
    # First count all files to scan for progress bar
    print("🔍 Counting files to scan...")
    total_files = 0
    for root, dirs, _ in os.walk(repo_path):
        dirs[:] = [d for d in dirs if d not in EXCLUDE_DIRS]
        files = [f for f in os.listdir(root) if f.endswith(supported_extensions)]
        total_files += len(files)
    
    # Now scan files with progress bar
    print(f"📂 Scanning {total_files} files in {repo_path} for links...")
    with tqdm(total=total_files, unit='file') as pbar:
        for root, dirs, _ in os.walk(repo_path):
            dirs[:] = [d for d in dirs if d not in EXCLUDE_DIRS]
            for file in os.listdir(root):
                if file.endswith(supported_extensions):
                    path = os.path.join(root, file)
                    try:
                        with open(path, 'r', encoding='utf-8') as f:
                            content = f.read()
                            matches = LINK_PATTERN.findall(content)
                            for match in matches:
                                full_url = urljoin(DOCS_BASE, match)
                                links.add((full_url, os.path.relpath(path, repo_path)))
                    except (UnicodeDecodeError, PermissionError):
                        pass
                    finally:
                        pbar.update(1)
    return sorted(links, key=lambda x: x[0])

def check_link(link_info):
    """Check if a single link is working"""
    url, source_file = link_info
    try:
        response = requests.head(url, allow_redirects=True, timeout=10)
        return (url, source_file, response.status_code < 400, response.status_code)
    except Exception:
        return (url, source_file, False, "Connection Error")

def check_links_concurrently(links):
    """Check multiple links concurrently with progress bar"""
    results = []
    with ThreadPoolExecutor(max_workers=MAX_WORKERS) as executor:
        futures = {executor.submit(check_link, link): link for link in links}
        with tqdm(total=len(links), unit='link') as pbar:
            for future in as_completed(futures):
                results.append(future.result())
                pbar.update(1)
    return results

def generate_report(results, output_file='link_report.md'):
    """Generate a Markdown report of the results"""
    working = [r for r in results if r[2]]
    broken = [r for r in results if not r[2]]
    
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write("# Documentation Links Status Report\n\n")
        f.write(f"## Summary\n")
        f.write(f"- Total links checked: {len(results)}\n")
        f.write(f"- Working links: {len(working)}\n")
        f.write(f"- Broken links: {len(broken)}\n\n")
        
        if broken:
            f.write("## Broken Links\n")
            for url, source_file, _, status in broken:
                f.write(f"- {url} (in `{source_file}`)\n")
                f.write(f"  - Status: {status}\n")
        
        f.write("\n## All Links Checked\n")
        for url, source_file, is_working, status in results:
            status_emoji = "✅" if is_working else "❌"
            f.write(f"- {status_emoji} {url} (in `{source_file}`)\n")

if __name__ == "__main__":
    # Find links with progress
    links = find_links_in_repo()
    print(f"📊 Found {len(links)} unique links to check")
    
    # Check links with progress
    print("\n🔗 Checking link statuses...")
    results = check_links_concurrently(links)
    
    # Generate report
    print("\n📝 Generating report...")
    generate_report(results)
    
    broken_count = sum(1 for r in results if not r[2])
    if broken_count > 0:
        print(f"\n❌ Found {broken_count} broken links! See 'link_report.md' for details.")
    else:
        print("\n🎉 All links are working! Report saved to 'link_report.md'")
