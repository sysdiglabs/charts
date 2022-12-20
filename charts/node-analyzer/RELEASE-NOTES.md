# What's Changed

### New Features
- **node-analyzer** [05728e3](https://github.com/sysdiglabs/charts/commit/05728e35705e99b979c4f6f2a523cc40367d9b51): release HostScanner 0.3.1 ([#783](https://github.com/sysdiglabs/charts/issues/783))

    * * HostScanner, bumped to version 0.3.1 which brings:
        * Security fix for CVE-2022-32149
        * Support for GoogleCOS hosts non-os packages scan
        * Added `nodeAnalyzer.hostScanner.additionalDirsToScan` value to set additional folders to be scanned besides the default ones
        * Added new entries to the default set of directories to be scanned
            * Generic binaries (such as docker/containerd and infra tooling)
                * /bin,/sbin,/usr/bin,/usr/sbin,/usr/share,/usr/local
            * Libraries (such as default python libs)
                * /usr/lib,/usr/lib64
            * GoogleCOS tooling directories
                * /var/lib/google,/var/lib/toolbox,/var/lib/cloud

#### Full diff: https://github.com/sysdiglabs/charts/compare/node-analyzer-1.8.13...node-analyzer-1.8.14
