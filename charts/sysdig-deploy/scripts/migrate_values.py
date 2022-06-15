import copy
import sys
import yaml


## path mappings for values to be extracted to globals
GLOBAL_VALUES = [
    ("clusterName",                    "global.clusterConfig.name"),
    ("sysdig.accessKey",               "global.sysdig.accessKey"),
    ("sysdig.existingAccessKeySecret", "global.sysdig.accessKeySecret"),
    ("image.registry",                 "global.image.registry"),
]

## The keys listed here will be copied over to their respective sections as-is
AGENT_VALUES = [
    "auditLog",
    "collectorSettings",
    "daemonset",
    "ebpf",
    "extraVolumes",
    "gke",
    "image.repository",
    "image.tag",
    "image.pullPolicy",
    "leaderelection",
    "namespace",
    "priorityClassName",
    "prometheus",
    "proxy",
    "psp",
    "rbac",
    "resourceProfile",
    "scc",
    "secure",
    "serviceAccount",
    "slim",
    "sysdig.disableCaptures",
    "sysdig.settings",
    "timezone",
    "tolerations",
]

NODE_ANALYZER_VALUES = [
    "gke",
    "image.pullPolicy",
    "natsUrl",
    "nodeAnalyzer",
    "psp",
    "rbac",
    "scc",
    "secure",
]


## helpers for migrating values
## returns nested key if it exists, or None
def get_nested_key(key, values):
    nested_keys = key.split(".")

    value = values
    for nested_key in nested_keys:
        value = value.get(nested_key, None)
        if value is None:
            break

    return copy.deepcopy(value)


## set nested key, creating nested dicts if required
def set_nested_key(key, value, values):
    nested_keys = key.split(".")

    path = values
    for nested_key in nested_keys[:-1]:
        if nested_key in path:
            path = path.get(nested_key, None)
        else:
            path[nested_key] = {}
            path = path[nested_key]

    path[nested_keys[-1]] = value


# copy keys from old path to new
def populate_globals(new_values, old_values):
    for old_path, new_path in GLOBAL_VALUES:
        value = get_nested_key(old_path, old_values)
        if value:
            set_nested_key(new_path, value, new_values)


def populate_agent(new_values, old_values):
    agent_values = {}

    for key in AGENT_VALUES:
        value = get_nested_key(key, old_values)
        if value:
            set_nested_key(key, value, agent_values)

    new_values["agent"] = agent_values


def populate_node_analyzer(new_values, old_values):
    node_analyzer_values = {}

    for key in NODE_ANALYZER_VALUES:
        value = get_nested_key(key, old_values)
        if value:
            set_nested_key(key, value, node_analyzer_values)

    new_values["nodeAnalyzer"] = node_analyzer_values


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

