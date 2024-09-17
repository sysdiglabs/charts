# Chart: Agent

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
# v1.29.4
### Chores
* **ci** [fc5ecbaa](https://github.com/sysdiglabs/charts/commit/fc5ecbaaee10ec74f09a77a40be626f34e7dd292): bump bitnami/kubectl image references ([#1946](https://github.com/sysdiglabs/charts/issues/1946))
# v1.29.3
### New Features
* **agent** [2cd73379](https://github.com/sysdiglabs/charts/commit/2cd73379b9e38767fbae20169b1cf7299d13fc4f): create a clusterrolebinding if the clusterrole cluster-monitoring-view exists [SMAGENT-8031] ([#1938](https://github.com/sysdiglabs/charts/issues/1938))
# v1.29.2
### Chores
* **ci** [e222f21d](https://github.com/sysdiglabs/charts/commit/e222f21de483926259c9574e4c2d9679681b9ddb): bump bitnami/kubectl image references ([#1892](https://github.com/sysdiglabs/charts/issues/1892))
# v1.29.1
### Bug Fixes
* **agent** [16f961e7](https://github.com/sysdiglabs/charts/commit/16f961e75638e964eabcb3aed97893e961d1213b): Reorder volume list  (replace [#1899](https://github.com/sysdiglabs/charts/issues/1899)) ([#1917](https://github.com/sysdiglabs/charts/issues/1917))
# v1.29.0
### New Features
* [3c1919c5](https://github.com/sysdiglabs/charts/commit/3c1919c5322d8f3a0336e3f6670f98528cac922f): release agent 13.4.0 ([#1913](https://github.com/sysdiglabs/charts/issues/1913))
# v1.28.0
### Chores
* **agent,sysdig-deploy** [5b43c245](https://github.com/sysdiglabs/charts/commit/5b43c245a82bbddb3b58b1c63d69b846686f1a17): mount /host/dev volume readonly on ebpf mode ([#1901](https://github.com/sysdiglabs/charts/issues/1901))
# v1.27.18
### Bug Fixes
* **agent** [0d1a0673](https://github.com/sysdiglabs/charts/commit/0d1a06734f04032c2fdcd6bd0ca61f384db01ae4): set allowHostPorts when needed ([#1893](https://github.com/sysdiglabs/charts/issues/1893))
# v1.27.17
### Bug Fixes
* **agent** [4d0d730e](https://github.com/sysdiglabs/charts/commit/4d0d730ebaae28fa79e50aed99782bfc7da3615b): add kspm-analyzer specific settings to agent pod when enabled ([#1889](https://github.com/sysdiglabs/charts/issues/1889))
# v1.27.16
### New Features
* [f0c9a27a](https://github.com/sysdiglabs/charts/commit/f0c9a27a39ea5bcfd8e2a71c04d3756e47ac1487): release agent 13.3.3 ([#1881](https://github.com/sysdiglabs/charts/issues/1881))
# v1.27.15
### Bug Fixes
* **agent** [b193d652](https://github.com/sysdiglabs/charts/commit/b193d652c67930d83c62341800474448bde60f14): use dig function for prometheus_exporter settings check ([#1871](https://github.com/sysdiglabs/charts/issues/1871))
# v1.27.14
### New Features
* **agent** [d74fe798](https://github.com/sysdiglabs/charts/commit/d74fe7989e2ef332cef338fe05d7a4d08c1d490c): explicitly naming the prometheus metrics port in the agent daemonset ([#1869](https://github.com/sysdiglabs/charts/issues/1869))
# v1.27.13
### Bug Fixes
* **agent** [7f66f3a5](https://github.com/sysdiglabs/charts/commit/7f66f3a531452ca0bf0bd957e720e5affbddbdad): Fix doc for `windows.image.pullSecrets` ([#1867](https://github.com/sysdiglabs/charts/issues/1867))
# v1.27.12
### New Features
* **agent,node-analyzer** [9c21415e](https://github.com/sysdiglabs/charts/commit/9c21415e63126dbce960d0024bc632ff595ec6d1): add option to set hostNetwork and dnsPolicy ([#1863](https://github.com/sysdiglabs/charts/issues/1863))
# v1.27.11
### New Features
* [b3de2d75](https://github.com/sysdiglabs/charts/commit/b3de2d75f96f4064330a977c0d6f590737d6f461): release agent 13.3.2 ([#1856](https://github.com/sysdiglabs/charts/issues/1856))
# v1.27.10
### Chores
* **node-analyzer,kspm-collector,agent,rapid-response** [fccdc179](https://github.com/sysdiglabs/charts/commit/fccdc1790d42e22c3d605303a4d5f904a0e91439): bump the bitnami/kubectl image reference in charts ([#1772](https://github.com/sysdiglabs/charts/issues/1772))
# v1.27.9
### New Features
* **common,admission-controller,agent,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [07abc204](https://github.com/sysdiglabs/charts/commit/07abc204fd61e4692b48cf36babf0eecae6d154b): Add support for the in1 region ([#1847](https://github.com/sysdiglabs/charts/issues/1847))
# v1.27.8
### Bug Fixes
* **agent** [4aa59d01](https://github.com/sysdiglabs/charts/commit/4aa59d01292f0df09bdbbc00a95c6ddcc5967c66): fix issue on the extraVolume mount for the init container ([#1840](https://github.com/sysdiglabs/charts/issues/1840))
# v1.27.7
### Chores
* **agent** [9be47a0d](https://github.com/sysdiglabs/charts/commit/9be47a0dd84a6053661611e37a9af02eb22ec259): add kmodule.extraVolumes to daemonset ([#1838](https://github.com/sysdiglabs/charts/issues/1838))
# v1.27.6
# v1.27.5
### New Features
* [d1babb9f](https://github.com/sysdiglabs/charts/commit/d1babb9f03b70f5cebefc42927c7bb778100cf64): release agent 13.3.1 ([#1815](https://github.com/sysdiglabs/charts/issues/1815))
# v1.27.4
### Bug Fixes
* **agent** [7bf898a1](https://github.com/sysdiglabs/charts/commit/7bf898a10d09460864b74cdebe3f03822c99fb23): revert /lib64 volume mount ([#1813](https://github.com/sysdiglabs/charts/issues/1813))
# v1.27.3
### Bug Fixes
* **agent** [884e866d](https://github.com/sysdiglabs/charts/commit/884e866d51066b3525070c764909da586f3d12f3): restore version 13.2.1 ([#1812](https://github.com/sysdiglabs/charts/issues/1812))
# v1.27.2
### New Features
* **agent** [401c54eb](https://github.com/sysdiglabs/charts/commit/401c54eb00421dc36f603d5e00426e2658d5ef80): add /lib64 volume mount ([#1801](https://github.com/sysdiglabs/charts/issues/1801))
# v1.27.1
### Chores
* **agent** [2ea1ea65](https://github.com/sysdiglabs/charts/commit/2ea1ea65866c9e237fc7498e748b84ef990fb5fc): bump the Windows Agent release to 1.0.1 ([#1804](https://github.com/sysdiglabs/charts/issues/1804))
# v1.27.0
### New Features
* **agent** [14e85ea9](https://github.com/sysdiglabs/charts/commit/14e85ea9af9d83e65ad7aa8074b089024b327d73): privileged flag for Sysdig Agent  ([#1743](https://github.com/sysdiglabs/charts/issues/1743))
# v1.26.0
### New Features
* [8c39a945](https://github.com/sysdiglabs/charts/commit/8c39a9451035bf28b8af543fa6726c767927cad1): release agent 13.3.0 ([#1799](https://github.com/sysdiglabs/charts/issues/1799))
# v1.25.0
### New Features
* **agent** [ce6bdcd9](https://github.com/sysdiglabs/charts/commit/ce6bdcd95c97e658a38b2733aa773864494dba7b): add support for Windows Agent ([#1730](https://github.com/sysdiglabs/charts/issues/1730))
# v1.24.5
### Chores
* **agent,cluster-shield,sysdig-deploy,rapid-response,kspm-collector,cluster-scanner** [87059f19](https://github.com/sysdiglabs/charts/commit/87059f1992b6bf1c133ef96937ea2da90fa7d8a1): bump helm-unittest to v0.5.1 ([#1785](https://github.com/sysdiglabs/charts/issues/1785))
# v1.24.4
### Bug Fixes
* **agent** [c85da268](https://github.com/sysdiglabs/charts/commit/c85da2687541c4a1f0bbf85199bbdecdb027dbbd): [SMAGENT-7391] fix path of CA certificate to be used for proxy ([#1776](https://github.com/sysdiglabs/charts/issues/1776))
# v1.24.3
### New Features
* [4c1696d2](https://github.com/sysdiglabs/charts/commit/4c1696d25db079854a120001dbbe3cbce1d79e68): release agent 13.2.1 ([#1769](https://github.com/sysdiglabs/charts/issues/1769))
# v1.24.2
### Bug Fixes
* **agent** [7f087f0b](https://github.com/sysdiglabs/charts/commit/7f087f0b40158e976bc69abddeca0fc0947a986a): add the the missing channel for Agent Local Forwarder ([#1766](https://github.com/sysdiglabs/charts/issues/1766))
# v1.24.1
### New Features
* **agent,kspm-collector,node-analyzer,rapid-response** [c0359500](https://github.com/sysdiglabs/charts/commit/c0359500433949727357cfd918d43d9a0e0dbe11): update kubectl images used for testing purpose ([#1758](https://github.com/sysdiglabs/charts/issues/1758))
# v1.24.0
### New Features
* [67814659](https://github.com/sysdiglabs/charts/commit/678146599e3dde46aa57c025b1db86869838cd9d): release agent 13.2.0 ([#1748](https://github.com/sysdiglabs/charts/issues/1748))
# v1.23.3
### Chores
* **agent** [d1c6a829](https://github.com/sysdiglabs/charts/commit/d1c6a82958f7fe9a443632151e8efc39357a2a68): let memdump override also on secure-light mode ([#1736](https://github.com/sysdiglabs/charts/issues/1736))
# v1.23.2
### New Features
* [69b040bc](https://github.com/sysdiglabs/charts/commit/69b040bc9432a456c70ab37d72d9139398262bf1): release agent 13.1.1 ([#1734](https://github.com/sysdiglabs/charts/issues/1734))
# v1.23.1
### Chores
* **agent** [06666894](https://github.com/sysdiglabs/charts/commit/066668948b814d8d004c53e2ce5e122c41d39d72): allow to configure probes failureThreshold ([#1710](https://github.com/sysdiglabs/charts/issues/1710))
# v1.23.0
### New Features
* [5a4444cb](https://github.com/sysdiglabs/charts/commit/5a4444cbdb59d96c95199e5668b01d1d0b38db6b): release agent 13.1.0 ([#1705](https://github.com/sysdiglabs/charts/issues/1705))
# v1.22.7
### New Features
* **agent** [41107025](https://github.com/sysdiglabs/charts/commit/41107025c4ff1c897fcd1783bc2a2ce7a4dd026a): add tag to distinguish delegated deployment agents ([#1701](https://github.com/sysdiglabs/charts/issues/1701))
# v1.22.6
### New Features
* [359ac387](https://github.com/sysdiglabs/charts/commit/359ac3871f0e38a175802ed0e8f1c620b572e008): release agent 13.0.4 ([#1696](https://github.com/sysdiglabs/charts/issues/1696))
# v1.22.5
### New Features
* **agent** [8977c6f0](https://github.com/sysdiglabs/charts/commit/8977c6f046d1e00b126e96cda77eebae9e382766): revert ensure os-release file is mounted ([#1686](https://github.com/sysdiglabs/charts/issues/1686))
# v1.22.4
### Chores
* **agent** [208fc707](https://github.com/sysdiglabs/charts/commit/208fc7076e97d9d57ea422f7d3461b788f1a2204): revert ensure os-release file is mounted ([#1684](https://github.com/sysdiglabs/charts/issues/1684))
# v1.22.3
### New Features
* **agent** [a8bce052](https://github.com/sysdiglabs/charts/commit/a8bce0521e81091a76754b55f43de3933bf5dde2): ensure os-release file is mounted ([#1625](https://github.com/sysdiglabs/charts/issues/1625))
# v1.22.2
### New Features
* [fcaa2e3a](https://github.com/sysdiglabs/charts/commit/fcaa2e3a55890783c20940527b2f584dd5637f91): release agent 13.0.3 ([#1668](https://github.com/sysdiglabs/charts/issues/1668))
# v1.22.1
### New Features
* [3f99de7f](https://github.com/sysdiglabs/charts/commit/3f99de7f2eedb800cddce479d5d869a46abc76b9): release agent 13.0.2 ([#1658](https://github.com/sysdiglabs/charts/issues/1658))
# v1.22.0
# v1.21.1
### New Features
* [c99143c9](https://github.com/sysdiglabs/charts/commit/c99143c959ddf19b8335fba3631910c9e4b610f4): release agent 13.0.1 ([#1636](https://github.com/sysdiglabs/charts/issues/1636))
# v1.21.0
### New Features
* [b50da463](https://github.com/sysdiglabs/charts/commit/b50da46344d635678b4ac89c1f3c1cd1a1687d1b): release agent 13.0.0 ([#1628](https://github.com/sysdiglabs/charts/issues/1628))
# v1.20.2
### Chores
* **agent,sysdig-deploy** [59342938](https://github.com/sysdiglabs/charts/commit/59342938d7a1b9f22d93c5f2ebdf1dc164e50ebf): set promscrape port to 9091 by default when gke autopilot is enabled ([#1618](https://github.com/sysdiglabs/charts/issues/1618))
# v1.20.1
### Bug Fixes
* **agent** [1ef8c266](https://github.com/sysdiglabs/charts/commit/1ef8c266d888f460e0ed8b50f00d5d7886a6c155): Properly set ephemeral-storage on kmod container when slim+autopilot are enabled ([#1592](https://github.com/sysdiglabs/charts/issues/1592))
# v1.20.0
### New Features
* **common** [0061b52d](https://github.com/sysdiglabs/charts/commit/0061b52d51f43e1e4d5e2bdf1145be28287d5ce6): add me2 region support ([#1591](https://github.com/sysdiglabs/charts/issues/1591))
# v1.19.5
### Bug Fixes
* **agent,kspm-collector,node-analyzer,rapid-response,sysdig-deploy** [6b1f5818](https://github.com/sysdiglabs/charts/commit/6b1f5818836af26e5d83621049c96ae07d1fe12c): Set test rollout namespace based on required service accounts ([#1593](https://github.com/sysdiglabs/charts/issues/1593))
# v1.19.4
### New Features
* [b4f155be](https://github.com/sysdiglabs/charts/commit/b4f155bee9f48af7df9a9f147cac8d3d349453e7): release agent 12.20.0 ([#1584](https://github.com/sysdiglabs/charts/issues/1584))
# v1.19.3
### Bug Fixes
* **agent** [57626624](https://github.com/sysdiglabs/charts/commit/5762662438ca6c93aa38eed3facf87a7bccd3c52): properly render security block content ([#1577](https://github.com/sysdiglabs/charts/issues/1577))
# v1.19.2
### Bug Fixes
* **agent** [6f49dd5d](https://github.com/sysdiglabs/charts/commit/6f49dd5d86fff854440b811edc2ddecc7e28600a): fix logic to disable network topology and memdump only for secure light ([#1564](https://github.com/sysdiglabs/charts/issues/1564))
# v1.19.1
### New Features
* **agent** [7cf86a62](https://github.com/sysdiglabs/charts/commit/7cf86a6291502fe40624c0eaeba82d4894312093): enable falcobaseline for agent version 12.9.x and above ([#1561](https://github.com/sysdiglabs/charts/issues/1561))
# v1.19.0
### New Features
* [843751e0](https://github.com/sysdiglabs/charts/commit/843751e0a10b86053922b00da98255445b48fd90): release agent 12.19.0 ([#1548](https://github.com/sysdiglabs/charts/issues/1548))
# v1.18.4
### New Features
* **agent** [3be55461](https://github.com/sysdiglabs/charts/commit/3be55461cc3b28f710c1000583018c9584616681): add tolerations for rke2 master nodes ([#1539](https://github.com/sysdiglabs/charts/issues/1539))
# v1.18.3
### Bug Fixes
* **agent,sysdig-deploy** [d8e38523](https://github.com/sysdiglabs/charts/commit/d8e38523b3e94f0a6311bb5be8f5135e56d47f1c): /var/data volume mount ([#1532](https://github.com/sysdiglabs/charts/issues/1532))
# v1.18.2
### New Features
* **agent** [d86d3be1](https://github.com/sysdiglabs/charts/commit/d86d3be1eb2ee7da6b135f5262457c6f70f98264): update the readiness probes to use localhost ([#1530](https://github.com/sysdiglabs/charts/issues/1530))
# v1.18.1
### Bug Fixes
* **agent** [74d90fca](https://github.com/sysdiglabs/charts/commit/74d90fcae6332638233fb3a959dd724b30d82989): ephemeral-storage on gke autopilot and slim enabled ([#1519](https://github.com/sysdiglabs/charts/issues/1519))
# v1.18.0
### New Features
* **agent** [d17d3f80](https://github.com/sysdiglabs/charts/commit/d17d3f8030c6c2c50d659b6714439f49e68f1d85): mount agent http-proxy credentials as secret ([#1517](https://github.com/sysdiglabs/charts/issues/1517))
# v1.17.3
### Bug Fixes
* **agent** [b8c3e335](https://github.com/sysdiglabs/charts/commit/b8c3e3351824f6b0db17b1c0dac790b95efb7b33): GKE Autopilot do not accept HTTP probe ([#1508](https://github.com/sysdiglabs/charts/issues/1508))
# v1.17.2
### Bug Fixes
* **agent** [9c64b01a](https://github.com/sysdiglabs/charts/commit/9c64b01a687e59b6d5950e43f79b560bead87129): allows to specify non semver tags [SMAGENT-6093]  ([#1504](https://github.com/sysdiglabs/charts/issues/1504))
# v1.17.1
### New Features
* **agent** [5ec02705](https://github.com/sysdiglabs/charts/commit/5ec027053dd349769173ca7aa9db1dd395df7883): add support for new agent readiness probe ([#1437](https://github.com/sysdiglabs/charts/issues/1437))
# v1.17.0
### New Features
* **agent** [445f3c03](https://github.com/sysdiglabs/charts/commit/445f3c03e4236fdffbaba54b516da2993c519d2e): Add Local Forwarder support for Agent ([#1458](https://github.com/sysdiglabs/charts/issues/1458))
# v1.16.0
### New Features
* [2b91ee58](https://github.com/sysdiglabs/charts/commit/2b91ee5813a416c7e4fe20fa3639645904deba47): release agent 12.18.0 ([#1493](https://github.com/sysdiglabs/charts/issues/1493))
# v1.15.2
### Bug Fixes
* **agent,kspm-collector,node-analyzer,sysdig** [f378d192](https://github.com/sysdiglabs/charts/commit/f378d1922d0f21f5936c6ed872e6538536ccf1f2): whitespace errors ([#1436](https://github.com/sysdiglabs/charts/issues/1436))
# v1.15.1
### Chores
* **sysdig-deploy** [f3fe1283](https://github.com/sysdiglabs/charts/commit/f3fe12830eac8fff05c556ef970313615c7fafb5): Automatic version bump due to updated dependencies ([#1435](https://github.com/sysdiglabs/charts/issues/1435))
# v1.14.2
### New Features
* [629c5f06](https://github.com/sysdiglabs/charts/commit/629c5f06ccab168b9460ec1fa6564aed1a54c015): release agent 12.17.1 ([#1430](https://github.com/sysdiglabs/charts/issues/1430))
# v1.14.1
### Bug Fixes
* **agent** [e2a99859](https://github.com/sysdiglabs/charts/commit/e2a99859f5737d2023bac322b6e97ab85a0988a3): do not render universal ebpf env vars in gke autopilot ([#1426](https://github.com/sysdiglabs/charts/issues/1426))
# v1.14.0
# v1.13.15
### New Features
* [eda0e7cd](https://github.com/sysdiglabs/charts/commit/eda0e7cdf12c0b40f0bb77c0a16e0fd5f0173256): release agent 12.17.0 ([#1410](https://github.com/sysdiglabs/charts/issues/1410))
# v1.13.14
### New Features
* [9fc9ddd4](https://github.com/sysdiglabs/charts/commit/9fc9ddd48e6cb2c3ea334bfc10048ffc15646fd2): release agent 12.16.3 ([#1395](https://github.com/sysdiglabs/charts/issues/1395))
# v1.13.13
### Bug Fixes
* **common,agent,admission-controller,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [e76f1c17](https://github.com/sysdiglabs/charts/commit/e76f1c17e48491dd8ea21293ec1fed2619eed204): Update Sysdig CA ([#1393](https://github.com/sysdiglabs/charts/issues/1393))
# v1.13.12
### New Features
* [45e2f7a9](https://github.com/sysdiglabs/charts/commit/45e2f7a96c565bfe0687acaacf350e81f94a23bb): release agent 12.16.2 ([#1381](https://github.com/sysdiglabs/charts/issues/1381))
# v1.13.11
### Bug Fixes
* **agent** [4f8ca5c1](https://github.com/sysdiglabs/charts/commit/4f8ca5c1fec1af3d9b70e5860a307518b115e48a): add mount for host's `/run` vol for all deployment types ([#1373](https://github.com/sysdiglabs/charts/issues/1373))
# v1.13.10
### New Features
* [b2146b31](https://github.com/sysdiglabs/charts/commit/b2146b31e56eb00a6dc270bbb9bb530a3ee69f4c): release agent 12.16.1 ([#1353](https://github.com/sysdiglabs/charts/issues/1353))
# v1.13.9
### Bug Fixes
* **common,agent,node-analyzer,kspm-collector** [0806635e](https://github.com/sysdiglabs/charts/commit/0806635e5824365adb8ab3d8fd31811477c8918e): support multi-level map in agent.tags ([#1351](https://github.com/sysdiglabs/charts/issues/1351))
# v1.13.8
### New Features
* **agent,sysdig** [8aff7e6a](https://github.com/sysdiglabs/charts/commit/8aff7e6adcccd7ebbebabff7f7d89e5125fb8f46): use `updatecli` for agent version bumps during release ([#1338](https://github.com/sysdiglabs/charts/issues/1338))
# v1.13.7
### New Features
* **admission-controller,agent,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [32231059](https://github.com/sysdiglabs/charts/commit/322310597ffbf9e47b5755be8f2f65a6e68296a2): pass agent tags to kspm components ([#1333](https://github.com/sysdiglabs/charts/issues/1333))
# v1.13.6
### Bug Fixes
* **agent** [877a0bb0](https://github.com/sysdiglabs/charts/commit/877a0bb04a0af18ec4ce3609b52c47e54ae3ba6b): don't duplicate `cointerface_enabled` field in deployment agent configmaps ([#1299](https://github.com/sysdiglabs/charts/issues/1299))
# v1.13.5
### Others
* [b99f852c](https://github.com/sysdiglabs/charts/commit/b99f852c4176d570b0b3d342234cc14d95ab48c5)
# v1.13.4
### Bug Fixes
* **agent** [2de3cf99](https://github.com/sysdiglabs/charts/commit/2de3cf999b582f59bc11be923c4a407a0719036a): fix Chart.yaml field ([#1293](https://github.com/sysdiglabs/charts/issues/1293))
### Chores
* **agent** [924b96c1](https://github.com/sysdiglabs/charts/commit/924b96c1c98a5006fab4d4f71c91f9df9dbe639e): bump agent version to 12.16.0 ([#1292](https://github.com/sysdiglabs/charts/issues/1292))
# v1.13.2
### Bug Fixes
* **admission-controller,agent,sysdig-deploy** [bdf6c21f](https://github.com/sysdiglabs/charts/commit/bdf6c21f6322aaa8417fe8a763f01f5127601094): fix incompatibility errors on older helm versions ([#1281](https://github.com/sysdiglabs/charts/issues/1281))
# v1.13.1
### Bug Fixes
* **agent** [9e8d863e](https://github.com/sysdiglabs/charts/commit/9e8d863e39682aa17654c2a1a4a3554667789015): fix indentation for custom settings ([#1277](https://github.com/sysdiglabs/charts/issues/1277))
# v1.13.0
### New Features
* **sysdig-agent,node-analyzer,kspm-collector,rapid-response,admission-controller** [2dca8e7c](https://github.com/sysdiglabs/charts/commit/2dca8e7c5308e76c2da63c974ae75c4ad510c201): Global Custom CA Bundle Support ([#961](https://github.com/sysdiglabs/charts/issues/961))
# v1.12.1
# v1.12.0
### New Features
* **agent,rapid-response** [13dc488a](https://github.com/sysdiglabs/charts/commit/13dc488a6c1cbbfda114f90deeef91a43572a54e): set metadata.namespace on all namespaced items ([#1259](https://github.com/sysdiglabs/charts/issues/1259))
# v1.11.1
# v1.11.0
### New Features
* **agent** [cbc50cae](https://github.com/sysdiglabs/charts/commit/cbc50caebb117449796f7bb023c05d3acca6f796): decouple agent priorityclass creation from gke autopilot ([#1241](https://github.com/sysdiglabs/charts/issues/1241))
# v1.10.4
# v1.10.3
### New Features
* **agent** [07b8704c](https://github.com/sysdiglabs/charts/commit/07b8704cafb51b2dab6e99cac0e3fd6b4ad2449f): lower default cpu requests for kmodule container ([#1230](https://github.com/sysdiglabs/charts/issues/1230))
# v1.10.2
### Bug Fixes
* **agent** [0eee32a2](https://github.com/sysdiglabs/charts/commit/0eee32a2d85d65924df2c964e431b2bb1a78b5fc): trim newlines when applying nodeSelectors in delegatedAgentDeployments ([#1159](https://github.com/sysdiglabs/charts/issues/1159))
# v1.10.1
### Bug Fixes
* **common** [0e37805f](https://github.com/sysdiglabs/charts/commit/0e37805f0190b74b53f7d9b47e5528009f58aa4b): add missing CHANGELOG file and bump version ([#1223](https://github.com/sysdiglabs/charts/issues/1223))
### New Features
* **admission-controller,agent,common,kspm-collector,node-analyzer,rapid-response,sysdig-deploy** [47483bc0](https://github.com/sysdiglabs/charts/commit/47483bc0d5f872bc6d406a48491ac930d1d75f8f): Improve region resolution in all charts ([#946](https://github.com/sysdiglabs/charts/issues/946))
# v1.9.2
# v1.9.1
### Chores
* **agent** [15cfecb9](https://github.com/sysdiglabs/charts/commit/15cfecb905c931f3288907dd4223702536884b01): bump agent version to 12.15.0 ([#1200](https://github.com/sysdiglabs/charts/issues/1200))
# v1.9.0
### New Features
* **admission-controller,agent,cloud-bench,cloud-connector,cloud-scanning,harbor-scanner-sysdig-secure,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig,sysdig-deploy,sysdig-mcm-navmenu,sysdig-stackdriver-bridge** [5d99a03d](https://github.com/sysdiglabs/charts/commit/5d99a03dced132b4771dde1ce5b90b63c518b408): use a PGP private key to sign charts on release ([#1170](https://github.com/sysdiglabs/charts/issues/1170))
# v1.8.8
# v1.8.7
### Bug Fixes
* **agent,node-analyzer** [e0ef02c2](https://github.com/sysdiglabs/charts/commit/e0ef02c283df3d12cf5d8d2b1b89a61e1fc30807): updateStrategy maxSurge param ([#1166](https://github.com/sysdiglabs/charts/issues/1166))
# v1.8.6
### New Features
* **adminssion-controller,agent,node-analyzer,kspm-collector,rapid-response** [33cad895](https://github.com/sysdiglabs/charts/commit/33cad8952395800e2e453de6bbf81851bfe1c608): pull policy and secrets params uniformity ([#1158](https://github.com/sysdiglabs/charts/issues/1158))
# v1.8.5
### New Features
* **agent** [367456f5](https://github.com/sysdiglabs/charts/commit/367456f502af41c91432c996a42d9ff9ed1403ec): add drift_control to secure exclude lists when appropriate ([#1151](https://github.com/sysdiglabs/charts/issues/1151))
# v1.8.4
### Bug Fixes
* **agent** [e4da36a3](https://github.com/sysdiglabs/charts/commit/e4da36a3638c849b36660656f6e04dd5bb09fad2): Do not infer `max_parallel_cold_start` value ([#1133](https://github.com/sysdiglabs/charts/issues/1133))
# v1.8.3
### Chores
* **agent** [a55351db](https://github.com/sysdiglabs/charts/commit/a55351db97cde83da12d5bd4d1d921f735e8b9cf): bump agent version to 12.14.1 ([#1106](https://github.com/sysdiglabs/charts/issues/1106))
# v1.8.2
### Chores
* **agent** [7be099e](https://github.com/sysdiglabs/charts/commit/7be099e7099fa5d6bfee0d6d9314bf4c1e3d0b03): add tests to better highlight the behaviour in the drift prevention feature ([#1087](https://github.com/sysdiglabs/charts/issues/1087))
# v1.8.1
### Bug Fixes
* **agent** [c337ffb](https://github.com/sysdiglabs/charts/commit/c337ffb53abc3f9b17a6cb9e10f649a2434bba77): delegated agent volume name ([#1094](https://github.com/sysdiglabs/charts/issues/1094))
# v1.8.0
### New Features
* **agent** [5c194ec](https://github.com/sysdiglabs/charts/commit/5c194ecb04f68f7819415c5d98bb1909b28c9189): Fix GKE Autopilot installation ([#975](https://github.com/sysdiglabs/charts/issues/975))
# v1.7.5
### Bug Fixes
* **agent** [2024f12](https://github.com/sysdiglabs/charts/commit/2024f125f2bd049f63dc2309fde79afef1204dfe): Allow cointerface to be enabled in daemonset agents in delegated agent deployment ([#1079](https://github.com/sysdiglabs/charts/issues/1079))
# v1.7.4
### Bug Fixes
* **agent** [d9cbbdd](https://github.com/sysdiglabs/charts/commit/d9cbbdde53843f11d64223b3110378f0047c8697): fix occasional k8s_coldstart block duplication and key name ([#1069](https://github.com/sysdiglabs/charts/issues/1069))
# v1.7.3
### Chores
* **agent** [44f57ac](https://github.com/sysdiglabs/charts/commit/44f57ac7742edc044d5ce5a7fbddadf2d13c8846): bump agent version to 12.14.0 ([#1076](https://github.com/sysdiglabs/charts/issues/1076))
# v1.7.2
### Bug Fixes
* **agent** [34bf2af](https://github.com/sysdiglabs/charts/commit/34bf2afd26f848507cd8edff148f6253620657a9): Adjust features available in secure_light mode ([#1062](https://github.com/sysdiglabs/charts/issues/1062))
# v1.7.1
### Bug Fixes
* **agent,sysdig** [0702edd](https://github.com/sysdiglabs/charts/commit/0702eddfc46c823b8362b5f0d42e7be9d3bfe1ac): do not mount /var/lib when GKE autopilot is enabled ([#1047](https://github.com/sysdiglabs/charts/issues/1047))
# v1.7.0
### New Features
* **agent** [a44de57](https://github.com/sysdiglabs/charts/commit/a44de570eb9f124e6df2087e76ff817198a77b14): Move Agent lease permissions ([#1041](https://github.com/sysdiglabs/charts/issues/1041))
# v1.6.10
### Bug Fixes
* **agent,sysdig-deploy** [47651ab](https://github.com/sysdiglabs/charts/commit/47651ab557dd675a9daf0d3cdb0b758d63735e74): Reduce Agent mode misconfiguration from fail to NOTES output ([#1039](https://github.com/sysdiglabs/charts/issues/1039))
# v1.6.9
### Bug Fixes
* **admission-controller,agent,node-analyzer,rapid-response,registry-scanner,sysdig** [0bf9682](https://github.com/sysdiglabs/charts/commit/0bf96827ebf80d76aab61b8fa3d26b3903df220b): Improve KubeVersion Comparisons ([#1040](https://github.com/sysdiglabs/charts/issues/1040))
# v1.6.8
### Bug Fixes
* **agent** [6cefcd1](https://github.com/sysdiglabs/charts/commit/6cefcd1318c8054183afc72d8e76fd7075d0cc87): Fix dragent.yaml indentation for security block ([#1034](https://github.com/sysdiglabs/charts/issues/1034))
# v1.6.7
### Bug Fixes
* **agent** [4049502](https://github.com/sysdiglabs/charts/commit/40495021ac9daa2317b90a610f3081a43471dc0e): remove inline multiple checks that are not supported by helm 3.7 ([#1033](https://github.com/sysdiglabs/charts/issues/1033))
# v1.6.6
### Chores
* **admission-controller,agent,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig-deploy** [7f35eb1](https://github.com/sysdiglabs/charts/commit/7f35eb1f88d93fa59c2839e7fbb756e50a378bea): update helm unittest plugin ([#996](https://github.com/sysdiglabs/charts/issues/996))
# v1.6.5
### New Features
* **agent** [b97fbc8](https://github.com/sysdiglabs/charts/commit/b97fbc85a81f2d848230c63b6c49ae551551cd09): Add new monitor.enabled flag to agent chart ([#917](https://github.com/sysdiglabs/charts/issues/917))
# v1.6.4
### New Features
* **agent** [99a4b36](https://github.com/sysdiglabs/charts/commit/99a4b36bfd535264766b30ce176f4e244da0eb1f): Include /var/libs host volume mount ([#1009](https://github.com/sysdiglabs/charts/issues/1009))
# v1.6.3
### Chores
* **agent** [dc2a37a](https://github.com/sysdiglabs/charts/commit/dc2a37a2f4d63967e14874ee11c788eb7cd7fba1): bump agent version to 12.13.0 ([#1022](https://github.com/sysdiglabs/charts/issues/1022))
# v1.6.2
### New Features
* **agent** [d48ef54](https://github.com/sysdiglabs/charts/commit/d48ef54afb4c79c72d8b51a77d8e101f9d25a4f4): Add poddisruptionbudget permissions to the Agent clusterrole ([#968](https://github.com/sysdiglabs/charts/issues/968))
# v1.6.1
### Bug Fixes
* **agent** [9d7f5a4](https://github.com/sysdiglabs/charts/commit/9d7f5a43ff82ce2c6dac332c36146c2bda7516e7): Fix invalid comparison type ([#1002](https://github.com/sysdiglabs/charts/issues/1002))
# v1.6.0
### New Features
* **agent** [e3ed91f](https://github.com/sysdiglabs/charts/commit/e3ed91f82c6e5335fb56e2edb4d1f40803a16f10): Create Delegated Agent installation mechanism ([#945](https://github.com/sysdiglabs/charts/issues/945))
# v1.5.63
### Chores
* **agent** [e02fffc](https://github.com/sysdiglabs/charts/commit/e02fffce3c105b52742c7680fc1bf7d7f7765889): bump agent version to 12.12.1 ([#982](https://github.com/sysdiglabs/charts/issues/982))
# v1.5.62
### Chores
* **agent** [34ff1be](https://github.com/sysdiglabs/charts/commit/34ff1be89e4541582241b21f8790904ecf7b9f6b): bump agent version to 12.12.0 ([#974](https://github.com/sysdiglabs/charts/issues/974))
# v1.5.61
# v1.5.60
### Chores
* **agent** [f1d087f](https://github.com/sysdiglabs/charts/commit/f1d087f3533c361e30190af8cfddf29af97bc37b): bump agent version to 12.11.0 ([#927](https://github.com/sysdiglabs/charts/issues/927))
# v1.5.59
### Chores
* **agent,sysdig-deploy** [75ae713](https://github.com/sysdiglabs/charts/commit/75ae7139fa1bdb7693f0562015ddcff0a1a3f394): Update chart maintainers ([#919](https://github.com/sysdiglabs/charts/issues/919))
# v1.5.58
### Bug Fixes
* **agent** [a2891bc](https://github.com/sysdiglabs/charts/commit/a2891bc82b2cfef7be5da1d22f39f8b81b05c897): Fix agent.secure.enabled flag ([#858](https://github.com/sysdiglabs/charts/issues/858))
# v1.5.57
### New Features
* **agent,node-analyzer,rapid-response** [487b421](https://github.com/sysdiglabs/charts/commit/487b421c922e097047e5ca65c01cee466664daba): add Rancher-specific tolerations ([#884](https://github.com/sysdiglabs/charts/issues/884))
# v1.5.56
### Bug Fixes
* **agent** [6dcd65e](https://github.com/sysdiglabs/charts/commit/6dcd65ed1bc02e3c6929f0925167e803e820909b): Set agent node selector os and arch by k8s version ([#859](https://github.com/sysdiglabs/charts/issues/859))
# v1.5.55
### Documentation
* **agent,node-analyzer,sysdig,sysdig-stackdriver-bridge** [da18fe5](https://github.com/sysdiglabs/charts/commit/da18fe5e7225be9bbfc484d6dcb22987d7d08066): remove references of the deprecated --purge option for 'helm delete' ([#864](https://github.com/sysdiglabs/charts/issues/864))
# v1.5.54
### Documentation
* **agent,node-analyzer,sysdig** [bd37186](https://github.com/sysdiglabs/charts/commit/bd371864313e64d7a7ac07f79fe30f296b46d540): Remove references to Get Started in the READMEs ([#819](https://github.com/sysdiglabs/charts/issues/819))
# v1.5.53
### Chores
* **agent** [60531e5](https://github.com/sysdiglabs/charts/commit/60531e52a565b8dbf85c385d401e45661cbd54a5): bump agent version to 12.10.1
# v1.5.52
### Bug Fixes
* **agent** [ea56818](https://github.com/sysdiglabs/charts/commit/ea568182894e0803d92a9051bcd500792ee6bee2): Fix agent logPriority rendering ([#824](https://github.com/sysdiglabs/charts/issues/824))
# v1.5.51
### Bug Fixes
* **agent** [751015b](https://github.com/sysdiglabs/charts/commit/751015b713b0bd3a9a738f8e47d72cfe2167e70e): fix region us3 endpoints for agent and sysdig-deploy ([#823](https://github.com/sysdiglabs/charts/issues/823))
* **sysdig,agent** [096d6e4](https://github.com/sysdiglabs/charts/commit/096d6e4d0326f36357fec6ac61342c17e73b33ab): add extra secrets and tests ([#821](https://github.com/sysdiglabs/charts/issues/821))
# v1.5.50
### New Features
* **agent** [7df93a3](https://github.com/sysdiglabs/charts/commit/7df93a38409a902fe5372115bf8c545f84f804e9): add extra secrets ([#813](https://github.com/sysdiglabs/charts/issues/813))
# v1.5.49
### Chores
* **agent** [ede1c8e](https://github.com/sysdiglabs/charts/commit/ede1c8ebcacbf315814a272eb39f68150e1cc979): bump agent version to 12.10.0 ([#815](https://github.com/sysdiglabs/charts/issues/815))
# v1.5.48
### New Features
* **agent** [3975f58](https://github.com/sysdiglabs/charts/commit/3975f58a59bbcee90ead958939fd4722a8bf6e19): Add logPriority flag to agent chart ([#804](https://github.com/sysdiglabs/charts/issues/804))
# v1.5.47
### New Features
* [f4cb189](https://github.com/sysdiglabs/charts/commit/f4cb189afba6833fd458f99dcfcc0121f9d9dfa2)]: unify changelog headers ([#787](https://github.com/sysdiglabs/charts/issues/787))


## v1.5.46
### Minor changes
* Fixed links displayed in the Notes section

## v1.5.45
### Minor changes
* Updated chart icon

## v1.5.44
### Minor changes
* Do not add psp policy to clusterrole if k8s > 1.25

## v1.5.43
### Minor changes
* Added `node-role.kubernetes.io/control-plane` toleration

## v1.5.42
### Minor changes
* Added negative test case to check incorrect sysdig region input, also added code changes to fail on wrong sysdig region input.

## v1.5.41
### Minor changes
* Updated override helm tests to include extra testcases.

## v1.5.40
### Minor changes
* Readme changes to indicate helm unit testing.

## v1.5.39
### Minor changes
* Added golden template tests
## v1.5.38
### Minor changes
* Added unit tests to check conditional flag testing

## v1.5.37
### Minor changes
* Added unit tests for testing labels

## v1.5.36
### Minor changes
* Revert changes from 1.5.35 due to breaking OKD3.

## v1.5.35
### Minor changes
* Remove 'beta' from kubernets.io/arch and kubernetes.io/os in daemonset due to deprecation

## v1.5.34
### Minor changes
* Fixed .helmignore to add chart tests back when packaging the chart

## v1.5.33
### Minor changes
* Added unit tests for testing helm install commands in readme

## v1.5.32
### Minor changes
* Added unit tests to check local overrides of global values

This file documents all notable changes to the Sysdig Agent Helm Chart. The release numbering uses [semantic versioning](http://semver.org).

## v1.5.30
### Minor changes
* Tests: Added helm unit test to check apiEndpoint value set because of different region inputs.

## v1.5.29
### Minor changes
* Usage of global tags over existing value of tags

## v1.5.28
### Minor changes
* Add aroberts87 to chart maintainers

## v1.5.27
### Minor changes
* Removed trailing spaces

## v1.5.25
### Bugfix
* Don't deploy psp policies on k8s 1.25.x

## v1.5.24
### Minor changes
* Added a global gke autopilot flag

## v1.5.23
### Minor changes
* Added certificatesigningrequests resources in agent clusterrole

## v1.5.22

### Minor changes
* Add deployment test to agent chart

## v1.5.21

### Minor changes
* Moved the clusterrole's Ingresses resource in the networking.k8s.io group

## v1.5.19

### Bugfixes
* Don't mount /etc on GKE autopilot

## v1.5.18

### Minor changes
* Added /etc to container and initContainer /host/etc volume bind

## v1.5.17

### Minor changes
* Readme fixes

## v1.5.16

### Minor changes
* Removed warning from agent chart readme

## v1.5.15

### Minor changes
* Introduced support to proxy for agent initContainer

## v1.5.14
* Documentation fix slim-agent defaults to true

## v1.5.13

### Minor changes
* Reverted change for v1.5.10 that added /etc to /host/etc volume bind.

## v1.5.11

### Minor changes
* Added helper to accomodate agent configmapname

## v1.5.10

### Minor changes
* Added /etc to container /host/etc volume bind

## v1.5.9

### Bugfix

* Fix agent container name to match previous name `sysdig`

## v1.5.8

### Bugfix

* Fixed region collector addresses for us4, au1

## v1.5.7

### Minor Changes

* Fixed README redirect

## v1.5.6

### Bugfix

* make collectorHost required when region is custom

## v1.5.5

### Bugfix

* Require collectorHost to be specified if one of the SaaS regions isn't used

## v1.4.4

### Bugfix

* fix the `agent.ebpfEnabled` helper so it doesn't always evaluate to `true`

## v1.4.3

### Minor Changes

* Strip the custom appcheck stuff out of the agent chart


## v1.1.0

### Minor Changes

* Match the sysdig charts where the agent portion was updated up to version 1.12.70 from 1.12.56

## v1.0.0

### Major Changes

* Deploy only the Sysdig Agent daemonset and associated resources
* Automatically detect COS nodes and enable eBPF
* Use global common values for access key and cluster name
