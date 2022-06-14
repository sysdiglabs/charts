import copy
import sys
import yaml


## helpers for migrating values
def populate_globals(new_values, values):
    globals = {
        "clusterConfig": {},
        "sysdig": {},
        "image": {},
    }

    name = values.pop("clusterName", "")
    if name:
        globals["clusterConfig"]["name"] = name

    accessKey = values.get("sysdig", {}).pop("accessKey", "")
    if accessKey:
        globals["sysdig"]["accessKey"] = accessKey

    accessKeySecret = values.get("sysdig", {}).pop("existingAccessKeySecret", "")
    if accessKeySecret:
        globals["sysdig"]["accessKeySecret"] = accessKeySecret

    registry = values.get("image", {}).pop("registry", "")
    if registry:
        globals["image"]["registry"] = registry

    new_values["global"] = globals


def populate_agent(new_values, values):
    new_values["agent"] = copy.deepcopy(values)
    new_values["agent"].pop("nodeAnalyzer", {})
    new_values["agent"].pop("nodeImageAnalyzer", {})


def populate_node_analyzer(new_values, values):
    new_values["nodeAnalyzer"] = copy.deepcopy(values)
    new_values["nodeAnalyzer"].pop("daemonset", {})
    new_values["nodeAnalyzer"].pop("resourceProfile", {})
    new_values["nodeAnalyzer"].get("sysdig", {}).pop("settings", {})


def migrate_values(old_values_filename):
    old_values = {}
    with open(old_values_filename, 'r') as f:
        old_values = yaml.safe_load(f)

    new_values = {}
    populate_globals(new_values, old_values)
    populate_agent(new_values, old_values)
    populate_node_analyzer(new_values, old_values)

    new_values_yaml = yaml.dump(new_values, sort_keys=False)
    print(new_values_yaml)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python migrate_values.py <old_values_file>")
        sys.exit(1)

    old_values_filename = sys.argv[1]

    migrate_values(old_values_filename)
