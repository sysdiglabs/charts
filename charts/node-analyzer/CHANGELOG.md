# Chart: Node Analyzer

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
# v1.32.2
### Chores
* **ci** [fc5ecbaa](https://github.com/sysdiglabs/charts/commit/fc5ecbaaee10ec74f09a77a40be626f34e7dd292): bump bitnami/kubectl image references ([#1946](https://github.com/sysdiglabs/charts/issues/1946))
# v1.32.1
### Chores
* **node-analyzer** [5054a61c](https://github.com/sysdiglabs/charts/commit/5054a61c06d2ba07a2f88d643e4257f2bbf1cea3): bump sysdig/vuln-host-scanner to v0.12.1 ([#1941](https://github.com/sysdiglabs/charts/issues/1941))
# v1.32.0
### New Features
* **node-analyzer** [8b367c36](https://github.com/sysdiglabs/charts/commit/8b367c3679eb339886286cdde67ea4e7686a0b2a): Allow setting parameters for runtime and host scanner probes in Daemoset ([#1940](https://github.com/sysdiglabs/charts/issues/1940))
# v1.31.7
### Bug Fixes
* **node-analyzer** [3e8c4f6e](https://github.com/sysdiglabs/charts/commit/3e8c4f6ef196953c81f4b563b263aa3a221549b2): Reorder volume list ([#1934](https://github.com/sysdiglabs/charts/issues/1934))
# v1.31.6
### Bug Fixes
* **node-analyzer** [f6252060](https://github.com/sysdiglabs/charts/commit/f62520608ef424b423b5aeaf9df60b5b82de6d42): enable eve-integration when eveConnector is deployed [SSPROD-18967] ([#1927](https://github.com/sysdiglabs/charts/issues/1927))
# v1.31.5
### Chores
* **ci** [e222f21d](https://github.com/sysdiglabs/charts/commit/e222f21de483926259c9574e4c2d9679681b9ddb): bump bitnami/kubectl image references ([#1892](https://github.com/sysdiglabs/charts/issues/1892))
# v1.31.4
# v1.31.3
# v1.31.2
# v1.31.1
### New Features
* **node-analyzer** [4315173f](https://github.com/sysdiglabs/charts/commit/4315173f25c64bd1f67c209275e4d03cec1bda54): Added replication controllers to the list of inspected resources ([#1905](https://github.com/sysdiglabs/charts/issues/1905))
# v1.31.0
### Chores
* **node-analyzer,sysdig-deploy** [423695fc](https://github.com/sysdiglabs/charts/commit/423695fcf29dda4db2c3ae2e64abc53b2d278b50): bump sysdig/vuln-host-scanner to v0.11.0 ([#1888](https://github.com/sysdiglabs/charts/issues/1888))
# v1.30.5
# v1.30.4
# v1.30.3
### Chores
* **kspm-collector,node-analyzer** [d372a3c0](https://github.com/sysdiglabs/charts/commit/d372a3c01552094c8598493e9d1092e66fade67d): release kspm-collector & node-analyzer ([#1875](https://github.com/sysdiglabs/charts/issues/1875))
# v1.30.2
### New Features
* **agent,node-analyzer** [9c21415e](https://github.com/sysdiglabs/charts/commit/9c21415e63126dbce960d0024bc632ff595ec6d1): add option to set hostNetwork and dnsPolicy ([#1863](https://github.com/sysdiglabs/charts/issues/1863))
# v1.30.1
### New Features
* **node-analyzer** [3bcce318](https://github.com/sysdiglabs/charts/commit/3bcce31812ab03b07dcfe1ea3184abef84e266b9): release node-analyzer with bug fix for host-shield shell tmp folder ([#1860](https://github.com/sysdiglabs/charts/issues/1860))
# v1.30.0
### New Features
* **nodeanalyzer** [2c527dd0](https://github.com/sysdiglabs/charts/commit/2c527dd0121e4f13994824effa6a897189a56685): add tolerations for rke2 master nodes ([#1800](https://github.com/sysdiglabs/charts/issues/1800))
# v1.29.12
### New Features
* **node-analyzer** [53ae07dd](https://github.com/sysdiglabs/charts/commit/53ae07dda3161178017fd006d181b07aa51955a4): Update legacy engine NIA/HostAnalyzer component with security updates ([#1852](https://github.com/sysdiglabs/charts/issues/1852))
# v1.29.11
### New Features
* **nodeanalyzer** [33a305a5](https://github.com/sysdiglabs/charts/commit/33a305a51d1424638c87a16d6cc2cd204295ef9e): bump kspm analyzer version for node analyzer ([#1850](https://github.com/sysdiglabs/charts/issues/1850))
# v1.29.10
### Chores
* **node-analyzer,kspm-collector,agent,rapid-response** [fccdc179](https://github.com/sysdiglabs/charts/commit/fccdc1790d42e22c3d605303a4d5f904a0e91439): bump the bitnami/kubectl image reference in charts ([#1772](https://github.com/sysdiglabs/charts/issues/1772))
# v1.29.9
### New Features
* **common,admission-controller,agent,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [07abc204](https://github.com/sysdiglabs/charts/commit/07abc204fd61e4692b48cf36babf0eecae6d154b): Add support for the in1 region ([#1847](https://github.com/sysdiglabs/charts/issues/1847))
# v1.29.8
### Chores
* **node-analyzer** [761c8f58](https://github.com/sysdiglabs/charts/commit/761c8f587d0f33134ccf403827e83f3b79e7fba4): bump sysdig/vuln-host-scanner to v0.10.2 ([#1810](https://github.com/sysdiglabs/charts/issues/1810))
# v1.29.7
### New Features
* **node-analyzer** [798fee05](https://github.com/sysdiglabs/charts/commit/798fee055cbd3786c1f266f1277752608176a7d4): Change Bottlerocket apiclient and socket volume mounts to ignore non existent files ([#1797](https://github.com/sysdiglabs/charts/issues/1797))
# v1.29.6
### Chores
* **node-analyzer** [c144dca5](https://github.com/sysdiglabs/charts/commit/c144dca52b6ab39d4295f98d4227a76c23ed73a1): bump sysdig/vuln-host-scanner to v0.10.1 ([#1788](https://github.com/sysdiglabs/charts/issues/1788))
# v1.29.5
### Chores
* **node-analyzer** [e986b1f5](https://github.com/sysdiglabs/charts/commit/e986b1f5d92c817c6417105f3e8b65b2564bfe0a): bump sysdig/vuln-runtime-scanner to v1.7.1 ([#1786](https://github.com/sysdiglabs/charts/issues/1786))
# v1.29.4
# v1.29.3
### Bug Fixes
* **kspm-collector,node-analyzer** [919bac75](https://github.com/sysdiglabs/charts/commit/919bac7579929a11ca2f19fd39d9600271c345fe): fix pod failure in NATS connection error ([#1773](https://github.com/sysdiglabs/charts/issues/1773))
# v1.29.2
### New Features
* **agent,kspm-collector,node-analyzer,rapid-response** [c0359500](https://github.com/sysdiglabs/charts/commit/c0359500433949727357cfd918d43d9a0e0dbe11): update kubectl images used for testing purpose ([#1758](https://github.com/sysdiglabs/charts/issues/1758))
# v1.29.1
### Chores
* **node-analyzer** [fcb47948](https://github.com/sysdiglabs/charts/commit/fcb47948280b55cc964b8a7a1a564923e284bb4e): Bump benchmark runner ([#1675](https://github.com/sysdiglabs/charts/issues/1675))
# v1.29.0
### Chores
* **node-analyzer** [f3b29822](https://github.com/sysdiglabs/charts/commit/f3b29822e8bc3c60f48d0bac678b360eace7e133): bump sysdig/vuln-runtime-scanner to v1.7.0 ([#1750](https://github.com/sysdiglabs/charts/issues/1750))
# v1.28.0
### Chores
* **node-analyzer** [239f22e8](https://github.com/sysdiglabs/charts/commit/239f22e8e2a36e847e1a352212d52c0261ad6b5a): bump sysdig/vuln-host-scanner to v0.10.0 ([#1749](https://github.com/sysdiglabs/charts/issues/1749))
# v1.27.5
### Chores
* **node-analyzer** [c5a7c493](https://github.com/sysdiglabs/charts/commit/c5a7c4931a45a218c319085857f1bdf54df23a23): bump legacy node image analyzer to v0.1.32 ([#1738](https://github.com/sysdiglabs/charts/issues/1738))
# v1.27.4
### New Features
* **node-analyzer** [8229ffce](https://github.com/sysdiglabs/charts/commit/8229ffce6e561735ca587499be796c84af80e072): bump host-scanner to v0.9.1 ([#1739](https://github.com/sysdiglabs/charts/issues/1739))
# v1.27.3
### Others
* [549e723e](https://github.com/sysdiglabs/charts/commit/549e723e11f0cb0deff59715f5ed2d26bdf4568c)
# v1.27.2
### Chores
* **node-analyzer** [7336c1b9](https://github.com/sysdiglabs/charts/commit/7336c1b91aeddb057626f1a456a12a50a47e86d4): bump runtime-scanner to v1.6.12 ([#1737](https://github.com/sysdiglabs/charts/issues/1737))
# v1.27.1
### New Features
* **node-analyzer** [dbe2d40f](https://github.com/sysdiglabs/charts/commit/dbe2d40f15480af19ee1ca6a59b4d936cedca7db): Add flag in order to allow Bottlerocket volumes ([#1699](https://github.com/sysdiglabs/charts/issues/1699))
# v1.27.0
### Chores
* **node-analyzer** [c702f9dc](https://github.com/sysdiglabs/charts/commit/c702f9dc5b58cd0a6c18a2c82a813a524c347e5c): bump host-scanner to v0.9.0 ([#1713](https://github.com/sysdiglabs/charts/issues/1713))
# v1.26.5
### Bug Fixes
* **node-analyzer** [8ac36439](https://github.com/sysdiglabs/charts/commit/8ac36439f8d67ba20f29c9e29ee52b6fc698124f): use correct values for custom CA envs generation ([#1716](https://github.com/sysdiglabs/charts/issues/1716))
# v1.26.4
### New Features
* **kspm-collector,node-analyzer** [03e67add](https://github.com/sysdiglabs/charts/commit/03e67adde86b18ef4f96dfe58e6425534a3b4ac0): release kspm-collector & node-analyzer with support for CRN & name from IBM cloud MDS ([#1712](https://github.com/sysdiglabs/charts/issues/1712))
# v1.26.3
### Chores
* **node-analyzer** [4670c8ab](https://github.com/sysdiglabs/charts/commit/4670c8abb12e776d150f0be469242a5ef0dab392): bump vuln-host-scanner to v0.8.1 ([#1682](https://github.com/sysdiglabs/charts/issues/1682))
# v1.26.2
### Chores
* **node-analyzer** [4a193c1e](https://github.com/sysdiglabs/charts/commit/4a193c1ee0176568700347b0d700de8998c4da91): bump sysdig/vuln-runtime-scanner to v1.6.11 ([#1680](https://github.com/sysdiglabs/charts/issues/1680))
# v1.26.1
### New Features
* **node-analyzer,sysdig** [0d01a78f](https://github.com/sysdiglabs/charts/commit/0d01a78fc90334248a34b4791d07722243cda234): Update legacy engine NIA/HostAnalyzer components with security updates ([#1679](https://github.com/sysdiglabs/charts/issues/1679))
# v1.26.0
### New Features
* **node-analyzer,kspm-collector** [7d1201fc](https://github.com/sysdiglabs/charts/commit/7d1201fc5d1bfc18e9cfc24ed621e76773405d64): Skip TLS certificate verification when using TLS Proxy & bump applications version ([#1665](https://github.com/sysdiglabs/charts/issues/1665))
# v1.25.0
### Chores
* **node-analyzer** [a90c3952](https://github.com/sysdiglabs/charts/commit/a90c3952dd4448806a7e300eac2293965cf9797e): bump sysdig/vuln-host-scanner to v0.8.0 ([#1660](https://github.com/sysdiglabs/charts/issues/1660))

    * * Fixed a memory leak that could happen when disabling backend scanning
* Fixed an issue that could cause memory spikes
* Fixed an issue that could cause the host-scanner to detect wrongly the OS when running as a binary
* Added support for platform scanning
# v1.24.4
### New Features
* **admission-controller,node-analyzer** [9e8cc902](https://github.com/sysdiglabs/charts/commit/9e8cc902897f4185f9f56b825d6741539999fcf9): set dnsPolicy when we allow hostNetwork in the Pod  ([#1652](https://github.com/sysdiglabs/charts/issues/1652))
# v1.24.3
### Chores
* **kspm-collector,kspm-collector** [e885b38c](https://github.com/sysdiglabs/charts/commit/e885b38ccdf152db9227d0ecaf3b281f9f10752a): version bump of kspm-collector & node-analyzer ([#1650](https://github.com/sysdiglabs/charts/issues/1650))
# v1.24.2
### Chores
* **node-analyzer,kspm-collector** [53da744e](https://github.com/sysdiglabs/charts/commit/53da744e4aff66f4fdc86a462a4e72d7ed94ec92): Bump KSPM to 1.41.2 & Node Analyzer to 1.38.1 ([#1643](https://github.com/sysdiglabs/charts/issues/1643))
# v1.24.1
# v1.24.0
### Chores
* **node-analyzer,kspm-collector** [bf10775e](https://github.com/sysdiglabs/charts/commit/bf10775e88d40a12e1e3058d96f3ecdf6138c715): bump node-analyzer to v1.41.0 and kspm-collector to v1.38.0 ([#1627](https://github.com/sysdiglabs/charts/issues/1627))
# v1.23.1
# v1.23.0
### New Features
* **common** [0061b52d](https://github.com/sysdiglabs/charts/commit/0061b52d51f43e1e4d5e2bdf1145be28287d5ce6): add me2 region support ([#1591](https://github.com/sysdiglabs/charts/issues/1591))
# v1.22.7
### Chores
* **node-analyzer** [40786f31](https://github.com/sysdiglabs/charts/commit/40786f31e9209f0e64961b95320e633bafab6d67): bump sysdig/vuln-host-scanner to v0.7.5 ([#1605](https://github.com/sysdiglabs/charts/issues/1605))
# v1.22.6
### New Features
* **node-analyzer** [57653634](https://github.com/sysdiglabs/charts/commit/5765363486208c45cf5ec586cdec3bc045582445): Update legacy engine HostAnalyzer component with security updates ([#1603](https://github.com/sysdiglabs/charts/issues/1603))
# v1.22.5
### Bug Fixes
* **agent,kspm-collector,node-analyzer,rapid-response,sysdig-deploy** [6b1f5818](https://github.com/sysdiglabs/charts/commit/6b1f5818836af26e5d83621049c96ae07d1fe12c): Set test rollout namespace based on required service accounts ([#1593](https://github.com/sysdiglabs/charts/issues/1593))
# v1.22.4
### Chores
* **node-analyzer** [618ad521](https://github.com/sysdiglabs/charts/commit/618ad521c063b25d7f8e0a61d4c07e731eb36641): bump sysdig/vuln-runtime-scanner to v1.6.9 ([#1594](https://github.com/sysdiglabs/charts/issues/1594))
# v1.22.3
### Chores
* **node-analyzer,kspm-collector** [f1023ae1](https://github.com/sysdiglabs/charts/commit/f1023ae129bf5c95b13686bf793130d8fdbc6e50): Bump KSPM to 1.39.1 & Node Analyzer to 1.37.1 ([#1582](https://github.com/sysdiglabs/charts/issues/1582))
# v1.22.2
### Chores
* **node-analyzer** [8857425b](https://github.com/sysdiglabs/charts/commit/8857425ba0edef4849a8ddd77a99122af1ec3161): bump sysdig/vuln-runtime-scanner to v0.7.4 ([#1569](https://github.com/sysdiglabs/charts/issues/1569))
# v1.22.1
### Chores
* **node-analyzer** [474f2619](https://github.com/sysdiglabs/charts/commit/474f26194a45b6b0b694cdf58627ad01abac95d2): bump sysdig/vuln-host-scanner to v0.7.2 to fix missing container scanning results when using Podman v3 ([#1550](https://github.com/sysdiglabs/charts/issues/1550))
# v1.22.0
### Chores
* **node-analyzer,kspm-collector** [d80be00a](https://github.com/sysdiglabs/charts/commit/d80be00a821b0af2f71da6fd04590fcd897e0b4a): Bump KSPM to 1.39.0 & Node Analyzer to 1.37.0 ([#1549](https://github.com/sysdiglabs/charts/issues/1549))
# v1.21.0
### New Features
* **node-analyzer** [1e512f9a](https://github.com/sysdiglabs/charts/commit/1e512f9af08674b87b01c17b9bc34c436e90ff8a): bumped host-scanner to 0.7.0 to add container scanning support ([#1538](https://github.com/sysdiglabs/charts/issues/1538))
# v1.20.4
### Chores
* **node-analyzer** [14068b24](https://github.com/sysdiglabs/charts/commit/14068b24e61b1a95634794599e8e105721701686): bump sysdig/vuln-runtime-scanner to v1.6.7 ([#1545](https://github.com/sysdiglabs/charts/issues/1545))
# v1.20.3
### Bug Fixes
* **nodeAnalyzer** [7019a941](https://github.com/sysdiglabs/charts/commit/7019a94176feca81f12b5458788bd62d5d8316a5): deamonset not being rollout after configuration changes ([#1533](https://github.com/sysdiglabs/charts/issues/1533))

    * * Fix node-analyzer daemonset rollout not triggered by a change in configuration
# v1.20.2
### New Features
* **node-analyzer** [809552f7](https://github.com/sysdiglabs/charts/commit/809552f71f8b17b9f57a72dd6b659e959eaa4fe4): namespace variable for runtime-scanner and eve-connector ([#1518](https://github.com/sysdiglabs/charts/issues/1518))
# v1.20.1
### Chores
* **node-analyzer** [9895cb00](https://github.com/sysdiglabs/charts/commit/9895cb002e359c36e857ea3e9dd867f34129aeef): Improve template to reflect eveEnabled settings in CM ([#1536](https://github.com/sysdiglabs/charts/issues/1536))
# v1.20.0
### New Features
* **node-analyzer** [c43ad629](https://github.com/sysdiglabs/charts/commit/c43ad6292b8538d65de2267cf0aba9d55067e7d4): In-USE (EVE) enabled by default ([#1501](https://github.com/sysdiglabs/charts/issues/1501))
# v1.19.2
### Chores
* **sysdig, node-analyzer** [4a1a9a1d](https://github.com/sysdiglabs/charts/commit/4a1a9a1d7feaeb4ee04b2c17e4b84d8440cf6901): bump sysdig/vuln-runtime-scanner to v1.6.6 ([#1526](https://github.com/sysdiglabs/charts/issues/1526))
# v1.19.1
### Chores
* **admission-controller,cloud-connector,cluster-scanner,node-analyzer,registry-scanner,sysdig-deploy** [9d5d8c58](https://github.com/sysdiglabs/charts/commit/9d5d8c5809d35bcb5e8060ccc454f446cb1e3bc7): change charts ownership ([#1461](https://github.com/sysdiglabs/charts/issues/1461))
# v1.19.0
### Chores
* **node-analyzer,kspm-collector** [045b5d37](https://github.com/sysdiglabs/charts/commit/045b5d3798eb60ac6bff33f168273dca8a49618b): Bump KSPM to 1.38.0 & Node Analyzer to 1.36.0 ([#1513](https://github.com/sysdiglabs/charts/issues/1513))
# v1.18.9
### Chores
* **node-analyzer** [be507e09](https://github.com/sysdiglabs/charts/commit/be507e09e99ea79486a8d881a611d239de126f30): bump KSPM to v1.37.0 ([#1510](https://github.com/sysdiglabs/charts/issues/1510))
# v1.18.8
### New Features
* **node-analyzer** [09aa4ee7](https://github.com/sysdiglabs/charts/commit/09aa4ee720186daf8c0a9511891053e68b9cc3cd): Update legacy engine NIA component with security updates ([#1490](https://github.com/sysdiglabs/charts/issues/1490))
# v1.18.7
### Chores
* **node-analyzer** [99b29b05](https://github.com/sysdiglabs/charts/commit/99b29b05e508df76646d7e8657ac8fde01fc5450): Update legacy HostAnalyzer to 0.1.18 ([#1487](https://github.com/sysdiglabs/charts/issues/1487))
# v1.18.6
### Chores
* **sysdig, node-analyzer** [6c7c27bf](https://github.com/sysdiglabs/charts/commit/6c7c27bf845b30af0eb5a4cb8f5fe330923d564f): bump sysdig/vuln-runtime-scanner to v1.6.4 [SSPROD-3285] ([#1477](https://github.com/sysdiglabs/charts/issues/1477))
# v1.18.5
### Chores
* **node-analyzer** [18e72be6](https://github.com/sysdiglabs/charts/commit/18e72be61f86f9d1851152c32919ff46dacc2066): bump sysdig/vuln-host-scanner to v0.6.8 [SSPROD-32850] ([#1474](https://github.com/sysdiglabs/charts/issues/1474))
# v1.18.4
### Chores
* **kspm-collector,node-analyzer** [0b43cdef](https://github.com/sysdiglabs/charts/commit/0b43cdef544b2a5d553479027c9065964c6c4829): update cspm agents to UBI image 1.5.8 ([#1469](https://github.com/sysdiglabs/charts/issues/1469))
# v1.18.3
### Bug Fixes
* **node-analyzer,sysdig-deploy** [5ea89862](https://github.com/sysdiglabs/charts/commit/5ea898622331b94947c0982261ca8d07971f48cf): Ability to disable sslVerifyCertificate per container on node-analyzer ([#1445](https://github.com/sysdiglabs/charts/issues/1445))
# v1.18.2
### Bug Fixes
* **agent,kspm-collector,node-analyzer,sysdig** [f378d192](https://github.com/sysdiglabs/charts/commit/f378d1922d0f21f5936c6ed872e6538536ccf1f2): whitespace errors ([#1436](https://github.com/sysdiglabs/charts/issues/1436))
# v1.18.1
### New Features
* **node-analyzer** [efa8afe4](https://github.com/sysdiglabs/charts/commit/efa8afe4483629350de8647277c6778896aafd09): Enable debug flag per single VM component(new engine only) and KSPM ([#1401](https://github.com/sysdiglabs/charts/issues/1401))
# v1.18.0
### New Features
* **node-analyzer,kspm-collector,sysdig-deploy** [f6f68ff0](https://github.com/sysdiglabs/charts/commit/f6f68ff0cd31693aaf26e0f3de53bb70a42182ad): allow custom proxy for individual containers in node analyzer ([#1432](https://github.com/sysdiglabs/charts/issues/1432))
# v1.17.13
### Chores
* **sysdig, node-analyzer** [2c6d3d0b](https://github.com/sysdiglabs/charts/commit/2c6d3d0bd9d1750d6f34c0bd7b3e2689482515b6): bump sysdig/vuln-runtime-scanner to v1.6.3 ([#1428](https://github.com/sysdiglabs/charts/issues/1428))
# v1.17.12
### Chores
* **kspm-collector,node-analyzer** [201126cf](https://github.com/sysdiglabs/charts/commit/201126cf8abb51996ee001665c17545210058ff9): KSPM v1.34.0 ([#1422](https://github.com/sysdiglabs/charts/issues/1422))
# v1.17.11
### Chores
* **node-analyzer** [a589d167](https://github.com/sysdiglabs/charts/commit/a589d16767394384bbc50eac4049b96d82d99355): bump sysdig/vuln-host-scanner to v0.6.5 ([#1420](https://github.com/sysdiglabs/charts/issues/1420))

    * * Hostscanner bumped to 0.6.5
     * Fixed a bug that could cause the host-scanner go in crash loop backoff due to a missing timeout when retrieving AWS labels
# v1.17.10
### New Features
* **node-analyzer** [02c55d84](https://github.com/sysdiglabs/charts/commit/02c55d84b746c0d136b0818d4d29df077c5576e5): enable DB V2 by default in Host and Runtime scanner ([#1416](https://github.com/sysdiglabs/charts/issues/1416))
# v1.17.9
### Chores
* **sysdig, node-analyzer** [84cfe9a5](https://github.com/sysdiglabs/charts/commit/84cfe9a5e6f989a9a42b14b3d16597436f23b4b1): update legacy nodeImageAnalyzer (0.1.29) and hostImageAnalyzer (0.1.17) ([#1407](https://github.com/sysdiglabs/charts/issues/1407))
# v1.17.8
### New Features
* **kspm-collector,node-analyzer** [660e610d](https://github.com/sysdiglabs/charts/commit/660e610d475cdac3b9d2c51da4af0a01abce31f6): add support for NATS_MAX_RECONNECT variable ([#1400](https://github.com/sysdiglabs/charts/issues/1400))
# v1.17.7
### Bug Fixes
* **kspm-collector,node-analyzer** [67f042fd](https://github.com/sysdiglabs/charts/commit/67f042fd9ebb72cd121751d46fb96f7c3ad539ba): add debug logs to cloud platform metadata loading ([#1398](https://github.com/sysdiglabs/charts/issues/1398))
# v1.17.6
### Bug Fixes
* **common,agent,admission-controller,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [e76f1c17](https://github.com/sysdiglabs/charts/commit/e76f1c17e48491dd8ea21293ec1fed2619eed204): Update Sysdig CA ([#1393](https://github.com/sysdiglabs/charts/issues/1393))
# v1.17.5
### Chores
* **node-analyzer** [a66360df](https://github.com/sysdiglabs/charts/commit/a66360dfbd00f1d82ab5da6f8b70a5e1d77440cf): remove broken link from values.yaml ([#1370](https://github.com/sysdiglabs/charts/issues/1370))
# v1.17.4
### Chores
* **node-analyzer** [fc65fee4](https://github.com/sysdiglabs/charts/commit/fc65fee45ac31030885407a7dbadd078096620ab): bump sysdig/vuln-host-scanner to v0.5.2 ([#1363](https://github.com/sysdiglabs/charts/issues/1363))
# v1.17.3
### Chores
* **sysdig, nodel-analyzer** [44e1c6a3](https://github.com/sysdiglabs/charts/commit/44e1c6a385faf3bdcdd0cb8427254338c68254c7): bump sysdig/vuln-runtime-scanner to v1.5.7 ([#1361](https://github.com/sysdiglabs/charts/issues/1361))
# v1.17.2
### Bug Fixes
* **node-analyzer** [58970c62](https://github.com/sysdiglabs/charts/commit/58970c62a7148f5bfbaaecfc2aa4f524d89657a4): prevent `custom_tags` from being set to `nil` ([#1355](https://github.com/sysdiglabs/charts/issues/1355))
# v1.17.1
### Bug Fixes
* **common,agent,node-analyzer,kspm-collector** [0806635e](https://github.com/sysdiglabs/charts/commit/0806635e5824365adb8ab3d8fd31811477c8918e): support multi-level map in agent.tags ([#1351](https://github.com/sysdiglabs/charts/issues/1351))
# v1.17.0
### Bug Fixes
* **node-analyzer** [340a9344](https://github.com/sysdiglabs/charts/commit/340a93448d0f3f1d4d7dbb830da7335266640835): node-analyzer jq/yq installation fix ([#1347](https://github.com/sysdiglabs/charts/issues/1347))
# v1.16.0
### New Features
* **admission-controller,agent,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [32231059](https://github.com/sysdiglabs/charts/commit/322310597ffbf9e47b5755be8f2f65a6e68296a2): pass agent tags to kspm components ([#1333](https://github.com/sysdiglabs/charts/issues/1333))
# v1.15.2
### Chores
* **node-analyzer** [de62a50b](https://github.com/sysdiglabs/charts/commit/de62a50b5e2e706157c564d9614688fe63d8da87): bump sysdig/vuln-host-scanner to v0.5 ([#1334](https://github.com/sysdiglabs/charts/issues/1334))
# v1.15.1
### Chores
* **sysdig, node-analyzer** [6b2c2efd](https://github.com/sysdiglabs/charts/commit/6b2c2efd7eccb16ad74df29d75daef664e2df9f7): bump sysdig/vuln-runtime-scanner to v1.5.6 ([#1331](https://github.com/sysdiglabs/charts/issues/1331))
# v1.15.0
### Chores
* **kspm-collector,node-analyzer** [96e039bb](https://github.com/sysdiglabs/charts/commit/96e039bbe88e2284c99da30e3612efde00e9d2ac): KSPM v1.30.0 ([#1322](https://github.com/sysdiglabs/charts/issues/1322))
# v1.14.7
### Chores
* **sysdig, node-analyzer** [0ba5baa3](https://github.com/sysdiglabs/charts/commit/0ba5baa3e690be1c2c3a92c4928558efffb33539): bump sysdig/vuln-runtime-scanner to v1.5.5 ([#1320](https://github.com/sysdiglabs/charts/issues/1320))

    * * Runtime Scanner bumped to 1.5.5
     * Fixed a bug that could cause the Runtime Scanner to perform unneeded rescans
# v1.14.6
### Chores
* **kspm-collector,node-analyzer** [3985651e](https://github.com/sysdiglabs/charts/commit/3985651e0c6d52788fa0e36a740499458571b6b0): KSPM v1.29.0 ([#1311](https://github.com/sysdiglabs/charts/issues/1311))
# v1.14.5
### Chores
* **sysdig, node-analyzer** [17d2e503](https://github.com/sysdiglabs/charts/commit/17d2e50326f587b154f43beb706627416ca6a4b6): bump sysdig/vuln-runtime-scanner to v1.5.4 ([#1305](https://github.com/sysdiglabs/charts/issues/1305))

    * * Runtime Scanner bumped to 1.5.4
     * Fixed a misbehavior of the image layer analyzer, which could lead to non-existing software artifacts being reported in the SBOM as a result of incorrect handling of opaque directories (ESC-3511).
# v1.14.4
### Documentation
* **admission-controller, cluster-scanner, registry-scanner, cloud-connector, node-analyzer, rapid-response, sysdig-deploy, agent** [df733e62](https://github.com/sysdiglabs/charts/commit/df733e6294eae1967197e3521473a5fab0282b67): update maintainers list ([#1283](https://github.com/sysdiglabs/charts/issues/1283))
# v1.14.3
### Bug Fixes
* **node-analyzer** [d5c2fffa](https://github.com/sysdiglabs/charts/commit/d5c2fffa9e9223ee6aea451f1ecdcee7610f02b8): permissions fix for CR sysdig-agent-node-analyzer ([#1272](https://github.com/sysdiglabs/charts/issues/1272))
# v1.14.2
### New Features
* **node-analyzer** [0ad8696a](https://github.com/sysdiglabs/charts/commit/0ad8696a0b38d2564121e6e798589f568e3547a8): Release eveconnector 1.1.2 ([#1280](https://github.com/sysdiglabs/charts/issues/1280))
# v1.14.1
### Chores
* **node-analyzer** [d59b8c97](https://github.com/sysdiglabs/charts/commit/d59b8c97488c9277885c203e0db39665625aa5ea): toggle volumes used by runtimeScanner and imageAnalyzer ([#1273](https://github.com/sysdiglabs/charts/issues/1273))
# v1.14.0
### New Features
* **kspm-collector,node-analyzer** [b302524f](https://github.com/sysdiglabs/charts/commit/b302524f75098299644ef541d71876180f61ed01): release agents v1.27.0 with RKE2 suport ([#1274](https://github.com/sysdiglabs/charts/issues/1274))
# v1.13.0
### New Features
* **sysdig-agent,node-analyzer,kspm-collector,rapid-response,admission-controller** [2dca8e7c](https://github.com/sysdiglabs/charts/commit/2dca8e7c5308e76c2da63c974ae75c4ad510c201): Global Custom CA Bundle Support ([#961](https://github.com/sysdiglabs/charts/issues/961))
# v1.12.1
### Chores
* **sysdig,node-analyzer** [00316d04](https://github.com/sysdiglabs/charts/commit/00316d042378fa75ac0ed9277b547236766ce816): bumped RuntimeScanner to 1.5.2 version ([#1275](https://github.com/sysdiglabs/charts/issues/1275))

    * * Added env var flag for internal timeout on scheduled operations
* Added fallback when connection to detected container runtime fails
* Security updates (July 2023). Fixed CVE
  *  CVE-2023-33199
# v1.12.0
### Bug Fixes
* **node-analyzer** [6dcb0a0a](https://github.com/sysdiglabs/charts/commit/6dcb0a0a5c32edc9aaa8c4821e3dfd2ce0888fe6): enable hostPID in node-analyzer ([#1271](https://github.com/sysdiglabs/charts/issues/1271))
# v1.11.3
### Chores
* **node-analyzer** [a22538b0](https://github.com/sysdiglabs/charts/commit/a22538b0455c4f1a6f2be577cbd0aaf904f3aad6): Bump benchmark runner ([#1269](https://github.com/sysdiglabs/charts/issues/1269))
# v1.11.2
### New Features
* **node-analyzer** [76af97ed](https://github.com/sysdiglabs/charts/commit/76af97edaae471525d78fd1115a0a6689223cfbb): updated legacy engine NIA compoment with latest release ([#1265](https://github.com/sysdiglabs/charts/issues/1265))
# v1.11.1
# v1.11.0
### New Features
* **node-analyzer** [6c0b1e6d](https://github.com/sysdiglabs/charts/commit/6c0b1e6d883c8372a142a4a4cf955f3ecda0fe24): allow node-analyzer chart to create its own priority class ([#1252](https://github.com/sysdiglabs/charts/issues/1252))
# v1.10.7
### Documentation
* **node-analyzer** [799649c4](https://github.com/sysdiglabs/charts/commit/799649c48c21b33083ee5a4a24642a010873d463): remove additional column from the configurations table ([#1251](https://github.com/sysdiglabs/charts/issues/1251))
# v1.10.6
### Documentation
* **node-analyzer** [8f952ad4](https://github.com/sysdiglabs/charts/commit/8f952ad43045ddcffa3fdbd346ed129f8da2f0fb): fix configuration table rendering ([#1249](https://github.com/sysdiglabs/charts/issues/1249))
# v1.10.5
# v1.10.4
### New Features
* **kspm-collector,node-analyzer** [b95c0dac](https://github.com/sysdiglabs/charts/commit/b95c0dac7dc7cf9feb64a824bd415bb34f708e99): add resource ID to Posture ([#1231](https://github.com/sysdiglabs/charts/issues/1231))
# v1.10.3
# v1.10.2
### Bug Fixes
* **kspm-collector,node-analyzer** [96da2bf6](https://github.com/sysdiglabs/charts/commit/96da2bf6a09a306e2e801ed6358080956130adc0): properly handle affinity beta annotations ([#1196](https://github.com/sysdiglabs/charts/issues/1196))
# v1.10.1
### Bug Fixes
* **common** [0e37805f](https://github.com/sysdiglabs/charts/commit/0e37805f0190b74b53f7d9b47e5528009f58aa4b): add missing CHANGELOG file and bump version ([#1223](https://github.com/sysdiglabs/charts/issues/1223))
### New Features
* **admission-controller,agent,common,kspm-collector,node-analyzer,rapid-response,sysdig-deploy** [47483bc0](https://github.com/sysdiglabs/charts/commit/47483bc0d5f872bc6d406a48491ac930d1d75f8f): Improve region resolution in all charts ([#946](https://github.com/sysdiglabs/charts/issues/946))
# v1.9.1
### Documentation
* **node-analyzer** [d43443a7](https://github.com/sysdiglabs/charts/commit/d43443a732bdbf710e094ea8ad8173d36c2fdc02): DOC-3214 - update for clarity ([#1171](https://github.com/sysdiglabs/charts/issues/1171))
# v1.9.0
### New Features
* **admission-controller,agent,cloud-bench,cloud-connector,cloud-scanning,harbor-scanner-sysdig-secure,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig,sysdig-deploy,sysdig-mcm-navmenu,sysdig-stackdriver-bridge** [5d99a03d](https://github.com/sysdiglabs/charts/commit/5d99a03dced132b4771dde1ce5b90b63c518b408): use a PGP private key to sign charts on release ([#1170](https://github.com/sysdiglabs/charts/issues/1170))
* **kspm-collector,node-analyzer** [880cbc98](https://github.com/sysdiglabs/charts/commit/880cbc9840cacd4c66f939ba1d52a70181408a17): add account ID to Posture ([#1185](https://github.com/sysdiglabs/charts/issues/1185))
# v1.8.65
### Chores
* **sysdig, node-analyzer** [706d562f](https://github.com/sysdiglabs/charts/commit/706d562f3d473f88fd1d257974cd3a127d672a2a): bump sysdig/vuln-runtime-scanner to v1.5.1 ([#1187](https://github.com/sysdiglabs/charts/issues/1187))

    * Runtimescanner bumped to 1.5.1
- Fix for CVE-2023-2253
# v1.8.64
### Bug Fixes
* **agent,node-analyzer** [e0ef02c2](https://github.com/sysdiglabs/charts/commit/e0ef02c283df3d12cf5d8d2b1b89a61e1fc30807): updateStrategy maxSurge param ([#1166](https://github.com/sysdiglabs/charts/issues/1166))
# v1.8.63
### New Features
* **adminssion-controller,agent,node-analyzer,kspm-collector,rapid-response** [33cad895](https://github.com/sysdiglabs/charts/commit/33cad8952395800e2e453de6bbf81851bfe1c608): pull policy and secrets params uniformity ([#1158](https://github.com/sysdiglabs/charts/issues/1158))
# v1.8.62
### Chores
* **node-analyzer** [9ed5c468](https://github.com/sysdiglabs/charts/commit/9ed5c468d40f8c64f4bc7710996261e9e40e3ec1): bump sysdig/vuln-host-scanner to v0.4 ([#1162](https://github.com/sysdiglabs/charts/issues/1162))

    * * Hostscanner bumped to 0.4
     * Updated the analyzer to inspect also vendor paths
     * Added support to apply image based accepts for all versions of the image, that image in a specific registry & repository, as well as a contain string for customized subsets of the environment
# v1.8.61
### Chores
* **sysdig, node-analyzer** [f9c8e102](https://github.com/sysdiglabs/charts/commit/f9c8e1028b4b4e79aba10e72f762f14956d54273): bump sysdig/vuln-runtime-scanner to v1.5 ([#1160](https://github.com/sysdiglabs/charts/issues/1160))

    * * Runtimescanner bumped to 1.5
     * Updated the analyzer to inspects also vendor paths
     * Added support to apply image based accepts for all versions of the image, that image in a specific registry & repository, as well as a contain string for customized subsets of the environment
# v1.8.60
### Chores
* **kspm-collector, node-analyzer** [1b347fe8](https://github.com/sysdiglabs/charts/commit/1b347fe80da79b95bfc7b0c4f51dd3cc12a6d0dc): bump KSPM to v1.24.0 ([#1144](https://github.com/sysdiglabs/charts/issues/1144))
# v1.8.59
### Chores
* **node-analyzer** [bf0b4fb4](https://github.com/sysdiglabs/charts/commit/bf0b4fb4f8100daac5fca312fd9622fbae87499d): bump sysdig/vuln-host-scanner to v0.3.10 ([#1126](https://github.com/sysdiglabs/charts/issues/1126))
# v1.8.58
### Chores
* **sysdig, node-analyzer** [601a0685](https://github.com/sysdiglabs/charts/commit/601a0685639cefc10ec9120c74153f4bb2ac2473): bump sysdig/vuln-runtime-scanner to v1.4.12 ([#1127](https://github.com/sysdiglabs/charts/issues/1127))
# v1.8.57
### Chores
* **kspm-collector, node-analyzer** [2807ef4b](https://github.com/sysdiglabs/charts/commit/2807ef4b5e33c587008a84f03c1c26f18e48019b): bump KSPM to v1.23.0  ([#1132](https://github.com/sysdiglabs/charts/issues/1132))
# v1.8.56
### New Features
* **node-analyzer** [0e7f2534](https://github.com/sysdiglabs/charts/commit/0e7f2534b5f6726d275c76d307910f8d909d3749): Update legacy engine HostAnalyzer with security updates ([#1129](https://github.com/sysdiglabs/charts/issues/1129))

    * Security updates (May 2023) for HostAnalyzer. Fixed 1 CVE:
	* CVE-2023-28840
# v1.8.55
### New Features
* **node-analyzer** [930926ef](https://github.com/sysdiglabs/charts/commit/930926efe251bd171c555d136030f5916a4ba04e): Update legacy engine NIA with security updates ([#1124](https://github.com/sysdiglabs/charts/issues/1124))

    * Security updates (May 2023) for NodeImageAnalyzer. Fixed 2 CVEs:
	* CVE-2023-30861
	* CVE-2023-28840
# v1.8.54
### New Features
* [19a5637d](https://github.com/sysdiglabs/charts/commit/19a5637d845bf05d06702955a8fb950f44d1aece): eve-connector priorityclassname added ([#1113](https://github.com/sysdiglabs/charts/issues/1113))
# v1.8.53
### New Features
* **node-analyzer** [729642d1](https://github.com/sysdiglabs/charts/commit/729642d13041aced698901d45f17ade57d109b9a): support settings passed as numbers ([#1093](https://github.com/sysdiglabs/charts/issues/1093))
# v1.8.52
### Bug Fixes
* **node-analyzer** [fd461c10](https://github.com/sysdiglabs/charts/commit/fd461c107d0c6fe3847a920d9851cd55ae566625): allow custom annotations on node analyzer daemonset ([#1097](https://github.com/sysdiglabs/charts/issues/1097))
# v1.8.51
### Bug Fixes
* **node-analyzer** [539e0a7](https://github.com/sysdiglabs/charts/commit/539e0a7b8641529e1276d0bca31a159256b4d720): Remove pullPolicy and pullSecrets duplicated entry ([#967](https://github.com/sysdiglabs/charts/issues/967))
# v1.8.50
### Chores
* **sysdig, node-analyzer** [a7564db](https://github.com/sysdiglabs/charts/commit/a7564dbac2f879064e000ef780b71ebc3d4463a7): bump sysdig/vuln-runtime-scanner to v1.4.11 ([#1061](https://github.com/sysdiglabs/charts/issues/1061))
# v1.8.49
### Bug Fixes
* **admission-controller,agent,node-analyzer,rapid-response,registry-scanner,sysdig** [0bf9682](https://github.com/sysdiglabs/charts/commit/0bf96827ebf80d76aab61b8fa3d26b3903df220b): Improve KubeVersion Comparisons ([#1040](https://github.com/sysdiglabs/charts/issues/1040))
# v1.8.48
### New Features
* **node-analyzer** [138602f](https://github.com/sysdiglabs/charts/commit/138602f0bf30808240f86ed35bad61f5496d1073): Allow daemonset to have maxUnavailable setting configurable ([#1029](https://github.com/sysdiglabs/charts/issues/1029))
# v1.8.47
### Chores
* **node-analyzer** [a8daf9c](https://github.com/sysdiglabs/charts/commit/a8daf9cb5776d1b154e4dfbf54a551c85bec1bcb): Release HostScanner and RuntimeScanner updates ([#1037](https://github.com/sysdiglabs/charts/issues/1037))

    * * Hostscanner bumped to 0.3.9
     * Support for .NET analyzer
* Runtimescanner bumped to 1.4.10
     * Support for .NET analyzer
# v1.8.46
### Chores
* **admission-controller,agent,kspm-collector,node-analyzer,rapid-response,registry-scanner,sysdig-deploy** [7f35eb1](https://github.com/sysdiglabs/charts/commit/7f35eb1f88d93fa59c2839e7fbb756e50a378bea): update helm unittest plugin ([#996](https://github.com/sysdiglabs/charts/issues/996))
# v1.8.45
### New Features
* **kspm-collector,node-analyzer** [af66e68](https://github.com/sysdiglabs/charts/commit/af66e68abcc2d0345ec84c93b7cba1f65a8b0a97): bumped KSPM to latest version ([#1019](https://github.com/sysdiglabs/charts/issues/1019))
# v1.8.44
### New Features
* **node-analyzer** [f3d3eb5](https://github.com/sysdiglabs/charts/commit/f3d3eb5ba7ab4d7e1dbef7f59270dea860428bfa): update runtimeScanner image with a fix for k8s v1.26 ([#1017](https://github.com/sysdiglabs/charts/issues/1017))

    * * Runtimescanner bumped to 1.4.9:
      * Fix: use CRI api v1 to ensure support for kubernetes v1.26
# v1.8.43
### New Features
* **node-analyzer** [fd600e8](https://github.com/sysdiglabs/charts/commit/fd600e86b1d28f141ca59439bc687c31fdc141b1): add extraVolumes to daemonset with nodeAnalyzer.extraVolumes.volumes

    * adds new option `nodeAnalyzer.extraVolumes.volumes`. This allows to define volumes for the nodeAnalyzer daemonset in a cleaner way.
Previously it was necessary to use the option `nodeAnalyzer.imageAnalyzer.extraVolumes.volumes`.
# v1.8.42
### New Features
* **node-analyzer** [79f7679](https://github.com/sysdiglabs/charts/commit/79f76794e271abf031216b261165f313192001f5): Update HostScanner and RuntimeScanner images containing latest security updates and fix ([#999](https://github.com/sysdiglabs/charts/issues/999))

    * * Hostscanner bumped to 0.3.8
     * Fix CVE-2022-41721
     * Fix CVE-2022-41723
     * Improved JAR's manifest parsing
* Runtimescanner bumped to 1.4.7
     * Improved JAR's manifest parsing
# v1.8.41
### New Features
* **node-analyzer** [90e8df4](https://github.com/sysdiglabs/charts/commit/90e8df4228ce33e3ec57e6401de545e3fb265ced): bumped RuntimeScanner and HostScanner to latest versions ([#993](https://github.com/sysdiglabs/charts/issues/993))

    * * Hostscanner bumped to 0.3.7, Runtimescanner bumped to 1.4.7
     * fixed issue with detection of vulns in java packages with version ending with .RELEASE
     * fixed issue with full java path not showing for dependencies (ex: jar in a war)
# v1.8.40
### New Features
* **sysdig** [5273f8e](https://github.com/sysdiglabs/charts/commit/5273f8e29d38d79981797f2060271733654110dd): Update legacy engine NIA/HostAnalyzer components with security updates ([#989](https://github.com/sysdiglabs/charts/issues/989))
# v1.8.39
### New Features
* **kspm-collector,node-analyzer** [3632fb0](https://github.com/sysdiglabs/charts/commit/3632fb0aabeb97a98d76c208e2cc566f376a08a3): bumped KSPM to latest version ([#977](https://github.com/sysdiglabs/charts/issues/977))
# v1.8.38
### Bug Fixes
* **sysdig,node-analyzer** [27ce551](https://github.com/sysdiglabs/charts/commit/27ce5515b64325ebe0e97762dbcc0a2b8deddbd3): Added missing volumeMount required for IBM OCP on legacy and new VM ([#955](https://github.com/sysdiglabs/charts/issues/955))
# v1.8.37
# v1.8.36
### New Features
* **kspm-collector,node-analyzer** [114c784](https://github.com/sysdiglabs/charts/commit/114c7840689472638326fc01d652c698830ec3a2): bumped KSPM to latest version ([#957](https://github.com/sysdiglabs/charts/issues/957))
# v1.8.35
### New Features
* **kspm-collector,node-analyzer** [3e111b6](https://github.com/sysdiglabs/charts/commit/3e111b6c16a7d81e13a2d1d7006d078bddda5885): bumped KSPM to latest version ([#939](https://github.com/sysdiglabs/charts/issues/939))
# v1.8.34
### New Features
* **node-analyzer,sysdig** [42e3aa5](https://github.com/sysdiglabs/charts/commit/42e3aa5c30a06166eb959632ec223149a6784421): Feat/bench runner bump to 1.1.0.8 ([#937](https://github.com/sysdiglabs/charts/issues/937))
# v1.8.33
### New Features
* **sysdig,node-analyzer** [407e669](https://github.com/sysdiglabs/charts/commit/407e6693e451059956838118d65a8e0cc68547c4): bump legacy NodeImageAnalyzer to v0.1.24 ([#935](https://github.com/sysdiglabs/charts/issues/935))
# v1.8.32
### New Features
* **kspm-analyzer, kspm-collector** [dedebca](https://github.com/sysdiglabs/charts/commit/dedebca2a44e00828d80379c00cafbb50d90db8d): OCP4 support ([#915](https://github.com/sysdiglabs/charts/issues/915))
# v1.8.31
### New Features
* **node-analyzer** [19ec540](https://github.com/sysdiglabs/charts/commit/19ec540233c937fa2a98cd87921161025439f693): bumped RuntimeScanner and HostScanner to latest versions ([#916](https://github.com/sysdiglabs/charts/issues/916))
# v1.8.30
### New Features
* **sysdig,node-analyzer** [61deccc](https://github.com/sysdiglabs/charts/commit/61decccbf840632176424593b3959c7b8499c4a6): bump legacy NodeImageAnalyzer to v0.1.23 ([#924](https://github.com/sysdiglabs/charts/issues/924))
# v1.8.29
### New Features
* **node-analyzer** [cce0f8c](https://github.com/sysdiglabs/charts/commit/cce0f8cf6922b1cd35a7de63926b4bf51c335182): Bump KSPM Analyzer to latest version ([#922](https://github.com/sysdiglabs/charts/issues/922))
# v1.8.28
### Bug Fixes
* **node-analyzer,kspm-collector** [59543e8](https://github.com/sysdiglabs/charts/commit/59543e8da45e1e61f21b2489500fe5452906bca0): Fix security context permission for KSPM components ([#907](https://github.com/sysdiglabs/charts/issues/907))
# v1.8.27
### Bug Fixes
* **node-analyzer,sysdig-deploy** [9e11852](https://github.com/sysdiglabs/charts/commit/9e118521c490c788ca6053b513f281d09a7f9ccd): Global proxy values for host-scanner ([#901](https://github.com/sysdiglabs/charts/issues/901))
# v1.8.26
### New Features
* **agent,node-analyzer,rapid-response** [487b421](https://github.com/sysdiglabs/charts/commit/487b421c922e097047e5ca65c01cee466664daba): add Rancher-specific tolerations ([#884](https://github.com/sysdiglabs/charts/issues/884))
# v1.8.25
### Bug Fixes
* **node-analyzer** [771c584](https://github.com/sysdiglabs/charts/commit/771c5846a79dd78a3a69ba20553a1c8f3e93b2ed): Make probes configurable ([#888](https://github.com/sysdiglabs/charts/issues/888))
# v1.8.24
### Bug Fixes
* **node-analyzer** [9cee27d](https://github.com/sysdiglabs/charts/commit/9cee27d3f1ac66e709e8a50f5dd5ad00fc9b52ee): increase initial delay of the probes ([#872](https://github.com/sysdiglabs/charts/issues/872))
# v1.8.23
### Documentation
* **agent,node-analyzer,sysdig,sysdig-stackdriver-bridge** [da18fe5](https://github.com/sysdiglabs/charts/commit/da18fe5e7225be9bbfc484d6dcb22987d7d08066): remove references of the deprecated --purge option for 'helm delete' ([#864](https://github.com/sysdiglabs/charts/issues/864))
# v1.8.22
### Chores
* **node-analyzer** [7971a25](https://github.com/sysdiglabs/charts/commit/7971a253e2fe4f282ab05c9e3316985646fd4009): Added test template for new runtime and host scanner ([#867](https://github.com/sysdiglabs/charts/issues/867))
# v1.8.21
### New Features
* **node-analyzer** [c2e8885](https://github.com/sysdiglabs/charts/commit/c2e88858702ff11b262aac6c695c78508ba0317d): host-scanner bump to 0.3.4 ([#857](https://github.com/sysdiglabs/charts/issues/857))
# v1.8.20
### Documentation
* **agent,node-analyzer,sysdig** [bd37186](https://github.com/sysdiglabs/charts/commit/bd371864313e64d7a7ac07f79fe30f296b46d540): Remove references to Get Started in the READMEs ([#819](https://github.com/sysdiglabs/charts/issues/819))
# v1.8.19
### Bug Fixes
* **node-analyzer,sysdig-deploy** [1e001d1](https://github.com/sysdiglabs/charts/commit/1e001d17e3ec9fce3db2043f8f626b53d157f159): Added quotes to Runtime Scanner probe port ([#863](https://github.com/sysdiglabs/charts/issues/863))
# v1.8.18
### New Features
* **node-analyzer** [d364d34](https://github.com/sysdiglabs/charts/commit/d364d342bddab96c6e78345bbb60e17e343a2463): runtimescanner bump to 1.4.4 ([#853](https://github.com/sysdiglabs/charts/issues/853))
# v1.8.17
### Bug Fixes
* **node-analyzer** [e894e55](https://github.com/sysdiglabs/charts/commit/e894e55a2febb72749ec44b214370596fa569fda): fix typo in dirs to scan and additional dirs set to analyzer instead of scanner ([#854](https://github.com/sysdiglabs/charts/issues/854))
# v1.8.16
### New Features
* **node-analyzer** [c351cf9](https://github.com/sysdiglabs/charts/commit/c351cf97b6ac5897167021699755a015eeb59005): release HostScanner 0.3.2  ([#847](https://github.com/sysdiglabs/charts/issues/847))
# v1.8.15
### New Features
* **node-analyzer** [c0a3768](https://github.com/sysdiglabs/charts/commit/c0a3768d53e292c1f124b1da795b8b2a177170f9): Update legacy engine NIA/HostAnalyzer component with security updates ([#844](https://github.com/sysdiglabs/charts/issues/844))

    * Security updates (December 2022) for NodeImageAnalyzer and HostAnalyzer components
# v1.8.14
### New Features
* **node-analyzer** [05728e3](https://github.com/sysdiglabs/charts/commit/05728e35705e99b979c4f6f2a523cc40367d9b51): release HostScanner 0.3.1 ([#783](https://github.com/sysdiglabs/charts/issues/783))

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
# v1.8.12
### New Features
* **node-analyzer** [90766bb](https://github.com/sysdiglabs/charts/commit/90766bbd66297671da37136503aef6d578b81e6b): runtimescanner bump to 1.4.1 ([#836](https://github.com/sysdiglabs/charts/issues/836))

## v1.8.12
### Minor changes
* RuntimeScanner: bump to version 1.4.1. Fixed 1 CVE:
  * CVE-2022-41717

# v1.8.11
### Bug Fixes
* **kspm-analyzer** [388dcdf](https://github.com/sysdiglabs/charts/commit/388dcdfb90c2834e09f0802370b521ce5b99570c): longer initial delay on analyzer startup probe ([#827](https://github.com/sysdiglabs/charts/issues/827))
# v1.8.10
### Documentation
* **node-analyzer** [1e0fb04](https://github.com/sysdiglabs/charts/commit/1e0fb04e90d6c88d22e3811fd312a8cf2378f26a): adding the new container and host scanner ([#797](https://github.com/sysdiglabs/charts/issues/797))
# v1.8.8
### New Features
* [f4cb189](https://github.com/sysdiglabs/charts/commit/f4cb189afba6833fd458f99dcfcc0121f9d9dfa2)]: unify changelog headers ([#787](https://github.com/sysdiglabs/charts/issues/787))

This file documents all notable changes to Sysdig Node Analyzer Helm Chart. The release numbering uses [semantic versioning](http://semver.org).

## 1.8.7
* bump kspm-analyzer to version 1.14.0

## 1.8.6
* namespace added to all namespaced resources

## 1.8.5
* BenchmarkRunner
    * bump to version 1.1.0.5

## 1.8.4
### Minor changes:
* Add deployment test to node analyzer chart

## 1.8.3
### Minor changes:
* BenchmarkRunner
    * bump to version 1.1.0.4

# v1.8.2
### Minor changes
* Updated chart icon

# v1.8.1
### Minor changes
* NodeAnalyzer:
    * NodeImageAnalyzer: bump to version 0.1.21 which contains security updates (November 2022). Fixed 21 CVEs in total, the ones with high or critical severity are:
        * CVE-2022-1941
        * CVE-2022-1996
        * CVE-2022-27191
        * CVE-2022-27664
        * CVE-2022-29361
        * CVE-2022-32149
        * CVE-2022-3515
        * CVE-2022-39237
        * CVE-2022-40674
    * HostAnalyzer: bump to version 0.1.13 (November 2022)

# v1.8.0
### Minor changes
* HostScanner: added to deamonset

## v1.7.48
### Minor changes
* RuntimeScanner: bump to version 1.4.0
	* path for nested java packages now reflect the nesting
	* fix for sporadic deadlocks when analyzing Java packages
	* added AcceptRisk support

## v1.7.47
### Minor changes
* Do not add psp policy to clusterrole if k8s > 1.25

## v1.7.46
### Minor changes
* Added `node-role.kubernetes.io/control-plane` toleration

## v1.7.45
### Minor changes
* Added negative test case to check incorrect sysdig region input, also added code changes to fail on wrong sysdig region input.

## v1.7.44
### Minor changes
* Updated override helm tests to include extra testcases.

## v1.7.43
### Minor changes
* Readme changes to indicate helm unit testing.

## v1.7.42
### Minor changes
* Added golden template tests

## v1.7.41
### Minor changes
* Added unit tests to check conditional flag testing

## v1.7.40
### Minor changes
* Added unit tests for testing labels

## 1.7.39
### Minor changes:
* BenchmarkRunner
    * bump to version 1.1.0.3

## v1.7.38
### Minor changes
* Added toleration doc on node-analyzer chart

## v1.7.37
### Minor change:
* Fixed .helmignore to not exclude chart tests when packaging the node-analyzer chart

## v1.7.36
### Minor changes:
* NodeAnalyzer:
    * RuntimeScanner: bump to version 1.3.0
        * fixes CVE-2022-32149
        * fixes CVE-2022-39237
        * add support for rhel9-based OSes

## v1.7.35
### Minor changes:
* Added unit tests for testing helm install commands in readme

## v1.7.34
### Minor changes:
* Added unit tests to check local overrides of global values

## v1.7.33

### Minor changes:
* KSPMAnalyzer:
    * Added liveliness and readiness probes.
    * All capabilities are now dropped.
    * Bumped image tag to 1.13.0
## v1.7.32
### Minor changes:
* NodeAnalyzer:
    * Runtimescanner: added ARM64 support

## 1.7.31
### Minor changes:
* BenchmarkRunner
    * bump to version 1.1.0.2

## v1.7.30

### Minor changes:
* Tests: Added helm unit test to check collector_endpoint value set because of different region inputs.

## v1.7.29

### Minor changes:
* KSPMAnalyzer: bump tag to 1.11.0

## v1.7.28

### Minor changes:
* NodeAnalyzer:
    * Replaced nodeAnalyzer.labels with daemonset.labels similar to how agent chart works to make it more consistent for customers.

## v1.7.27
### Minor changes:
* NodeAnalyzer:
    * NodeImageAnalyzer: bump to version 0.1.20 which contains security updates (October 2022)
        * CVE-2022-1941
        * CVE-2022-1996
        * CVE-2022-3515
        * CVE-2022-27191
        * CVE-2022-27664
        * CVE-2022-32149
        * CVE-2022-39237
        * CVE-2022-40674
    * HostAnalyzer: bump to version 0.1.12 which contains security updates (October 2022)
        * CVE-2022-27664
        * CVE-2022-32149

## v1.7.26
### Minor changes:
* BenchmarkRunner
    * multiarch builds
    * support arm64 hosts
    * bump to version 1.1.0.1

## v1.7.25
### Major changes:
* EveConnector:
    * Introduced proxy support
### Buxfix
* RuntimeScanner:
    * Fixed an issue where runtime scanner was not leverage on global proxy setting

## v1.7.24
### Minor changes:
* EveConnector:
    * bump to 1.1.0 version
### Bugfix
* EveConnector:
    * reduce the size of the image
    * bump dependencies to resolve critical and high vulnerabilities:
      * CVE-2022-1996
      * CVE-2022-1271
      * CVE-2022-2526
      * CVE-2022-3515

## v1.7.23
### Minor changes:
* RuntimeScanner:
    * bump to 1.2.13 version
### Bugfix
* RuntimeScanner:
    * fix jar parser to avoid duplicated pkgs

## v1.7.22
### Minor changes
* RuntimeScanner:
    * bump to 1.2.12 version
    * update vulnerable packages
    * bump to 1.19 Go version
### Bugfix
* RuntimeScanner:
    * fix container-storage locks

## v1.7.20
### Minor changes
* KSPMAnalyzer: bump tag to 1.9.0

## v1.7.19
### Minor changes
* RuntimeScanner: Added ability to support storage class for ephemeral storage.

## v1.7.18
### Minor changes
* BenchmarkRunner: bump tag to 1.0.19.0

## v1.7.17
### Bug fix
* Readme held incorrect values for runtimeScanner resources

## v1.7.16
### Bugfix
* Don't deploy psp policies on k8s 1.25.x

## v1.7.15
### Minor changes
* RuntimeScanner:
    * bump to 1.2.10 version
    * add image size and storage info to warning log

## v1.7.14
### Minor changes
* RuntimeScanner:
	* bump to 1.2.9 version
  	* configurable thresholds for maxFileSize and maxImageSize. Bigger files/images will be skipped
	* logging about the skipping of a file to be analysed changed from error to warning.

## v1.7.13
### Minor changes
* Added a global gke autopilot flag


## v1.7.12
### Minor changes
* HostAnalyzer: fixed certificates issue introduced in 0.1.10

## v1.7.11
### Minor changes
* RuntimeScanner: bumped to 1.2.8 with a fix regarding the dpkg packages version used to match vulnerabilities.

## v1.7.10
### Minor changes
* Security updates (August 2022) for NodeImageAnalyzer and HostAnalyzer components

## v1.7.9
### Minor changes
* RuntimeScanner: bumped to 1.2.7 which:
  * removed the old golang analyzer based on the go.sum files. Only go packages from binary will be analyzed.
  * fixes several bugs in loading images into openshift clusters.
  * improve memory consumption.

## v1.7.8
### Minor changes
* KSPMAnalyzer: bump tag to 1.8.0

## v1.7.7
### Minor changes
* KSPMAnalyzer: bump tag to 1.7.0

## v1.7.6
### Minor changes
* kspm-analyzer: Fixed configmap reference for environment variables

## v1.7.5
### Minor changes
* BenchmarkRunner: bump tag to 1.0.18.2

## v1.7.4
### Minor changes
* RuntimeScanner: bumped to 1.2.6 with fix of ignoring the fix solution date of a vuln when no fix version is available

# v1.7.3

### Minor changes
* kspm-analyzer: fixed agent_app_name value and support the arm64 architecture

# v1.7.2

### Minor changes
* Readme fixes

# v1.7.1

### Minor changes
* BenchmarkRunner: bump tag to 1.0.18.1

# v1.7.0

### Minor changes
* Add flags for disabling image analyzer, benchmark runner, host analyzer separately

## v1.6.0

### Minor changes
* Changed the names of configmaps and other resources to remove the redundant `nodeanalyzer` string
* Fixed the ClusterRole reference to the wrong podsecuritypolicy name
* Updated daemonset selector label to be less repetitive

# v1.5.14
### Minor changes
* KSPMAnalyzer: support proxy

## v1.5.13
### Minor changes
* RuntimeScanner: bumped to 1.2.5 with fixes on ruby file analyzer

## v1.5.12
### Minor changes
* Added helper to accomodate agent configmapname

## v1.5.11
### Minor changes
* RuntimeScanner: bumped to 1.2.4 with fixes on tmp dirs to be used during analysis

## v1.5.10
### Bugfixes
* Removed duplicate labels from deployment of `app.kubernetes.io/instance`

## v1.5.9
### Minor changes
* RuntimeScanner: bumped to 1.2.3 with fixes on java file analyzer

## v1.5.8
### Minor changes
* RuntimeScanner: bumped to 1.2.2 (performance improvement in pkgmeta client)

## v1.5.7
### Minor changes
* NodeImageAnalyzer: bumped to 0.1.18
* HostAnalyzer: bumped to 0.1.9
* RuntimeScanner: bumped to 1.2.0

## v1.5.6
### Bugfixes

* KSPM: Fix Analyzer nats url

## v1.5.5
### Bugfixes

* KSPM: Bumped image tag to 1.5.0

## v1.5.4
### Bugfixes

* Fix kspm-analyzer access key env

## v1.5.3
### Bugfixes

* Require apiEndpoint when region is custom
* Fix typo in clusterName helper call

## v1.5.2
### Minor changes
* KSPM Analyzer - fix container missing CPU\Memory limits & requests
* KSPM components - merge analyzer and collector deploy flags into 1

## v1.5.1
### Minor changes
* BenchmarkRunner: bump tag to 1.0.17.2

## v1.5.0
### Major change
* KSPMAnalyzer: rename cspm-analyzer to kspm-analyzer

### Minor changes
* KSPMAnalyzer: add documentation on port configuration
* KSPMAnalyzer: update image tag to 1.4.0

## v1.4.3
### Minor change

Update chart to match `sysdig v1.14.34`

## v1.4.2
### Minor change

* RuntimeScanner: added nodeAnalyzer.runtimeScanner.extraMounts for handle non-standard socket paths

## v1.4.1
### Minor change

* CSPM support AKS

## v1.4.0
### Major change

* Add CSPM Analyzer to Daemonset

## v1.3.0
### Bugfixes
* Additional bugfixes on the runtime Scanner
* RuntimeScanner provides correct image name in containerd environments
* RuntimeScanner provides correct image digest in dockerd environments

### Minor Changes

* Fix runtime-scanner `eve_enabled` check in configmap
* Release of runtime scanner 1.0.0
* RuntimeScanner: reduced and better disk usage for temporary files
* RuntimeScanner: added support for Runtime policies
* Added CRI-O support for runtime-scanner
* Improved runtime-scanner memory usage
* Updated runtime-scanner to the latest version

## v1.2.0

* Add `global.sysdig.region` variable for automatically determining collector endpoint

## v1.1.0

### Minor Changes

* Use global proxy settings when provided

## v1.0.0

### Major Changes

* Deploy only the Sysdig Node Analyzer and associated resources
