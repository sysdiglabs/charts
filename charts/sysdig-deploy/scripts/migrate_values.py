import copy
import sys
import yaml


## path mappings for values to be extracted to new paths
VALUES_MAPPINGS = [
    # globals
    ("clusterName",                     "global.clusterConfig.name"),
    ("sysdig.accessKey",                "global.sysdig.accessKey"),
    ("sysdig.existingAccessKeySecret",  "global.sysdig.accessKeySecret"),
    ("image.registry",                  "global.image.registry"),
    # agent-only
    ("auditLog",                        "agent.auditLog"),
    ("collectorSettings",               "agent.collectorSettings"),
    ("daemonset",                       "agent.daemonset"),
    ("ebpf",                            "agent.ebpf"),
    ("extraVolumes",                    "agent.extraVolumes"),
    ("gke",                             "agent.gke"),
    ("image.repository",                "agent.image.repository"),
    ("image.tag",                       "agent.image.tag"),
    ("image.pullPolicy",                "agent.image.pullPolicy"),
    ("leaderelection",                  "agent.leaderelection"),
    ("priorityClassName",               "agent.priorityClassName"),
    ("prometheus",                      "agent.prometheus"),
    ("proxy",                           "agent.proxy"),
    ("psp",                             "agent.psp"),
    ("rbac",                            "agent.rbac"),
    ("resourceProfile",                 "agent.resourceProfile"),
    ("scc",                             "agent.scc"),
    ("secure",                          "agent.secure"),
    ("serviceAccount",                  "agent.serviceAccount"),
    ("slim",                            "agent.slim"),
    ("sysdig.disableCaptures",          "agent.sysdig.disableCaptures"),
    ("sysdig.settings",                 "agent.sysdig.settings"),
    ("timezone",                        "agent.timezone"),
    ("tolerations",                     "agent.tolerations"),
    # node-analyzer-only
    ("gke",                             "nodeAnalyzer.gke"),
    ("image.pullPolicy",                "nodeAnalyzer.image.pullPolicy"),
    ("natsUrl",                         "nodeAnalyzer.natsUrl"),
    ("nodeAnalyzer",                    "nodeAnalyzer.nodeAnalyzer"),
    ("psp",                             "nodeAnalyzer.psp"),
    ("rbac",                            "nodeAnalyzer.rbac"),
    ("scc",                             "nodeAnalyzer.scc"),
    ("secure",                          "nodeAnalyzer.secure"),
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
def populate_values(new_values, old_values):
    for old_path, new_path in VALUES_MAPPINGS:
        value = get_nested_key(old_path, old_values)
        if value:
            set_nested_key(new_path, value, new_values)


def migrate_values(old_values_filename):
    old_values = {}
    with open(old_values_filename, 'r') as f:
        old_values = yaml.safe_load(f)

    new_values = {}
    populate_values(new_values, old_values)

    new_values_yaml = yaml.dump(new_values, sort_keys=False)
    print(new_values_yaml)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python migrate_values.py <old_values_file>")
        sys.exit(1)

    old_values_filename = sys.argv[1]

    migrate_values(old_values_filename)

