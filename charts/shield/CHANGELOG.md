# Chart: Shield

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
# v1.15.4
### Bug Fixes
* **shield** [ff026255](https://github.com/sysdiglabs/charts/commit/ff026255c116a35e16c6835473ee8bda578a8ac8): Sanitize version label on shield objects ([#2346](https://github.com/sysdiglabs/charts/issues/2346))
# v1.15.3
### Documentation
* **agent** [1f478085](https://github.com/sysdiglabs/charts/commit/1f47808574f81c12f656a762c23464f458e1e524): Add App Checks example as comments ([#2340](https://github.com/sysdiglabs/charts/issues/2340))
# v1.15.2
### New Features
* **agent,shield** [62c6f923](https://github.com/sysdiglabs/charts/commit/62c6f923ba84c97589b9ea85686ccf41a4043940): release agent 14.1.1 ([#2337](https://github.com/sysdiglabs/charts/issues/2337))
# v1.15.1
### Bug Fixes
* **response actions** [a5e8559b](https://github.com/sysdiglabs/charts/commit/a5e8559b9c3374ffdce4f2de3d156c2af27afea9): Add necessary permissions for jobs and replicasets ([#2334](https://github.com/sysdiglabs/charts/issues/2334))
# v1.15.0
### Chores
* **shield** [85d9d631](https://github.com/sysdiglabs/charts/commit/85d9d631c8cb679ae253204f07a9930ade7b4e45): cluster shield release 1.14.0 ([#2332](https://github.com/sysdiglabs/charts/issues/2332))
# v1.14.0
### Chores
* **shield** [cf14ab7b](https://github.com/sysdiglabs/charts/commit/cf14ab7b9dbc26cbb86720accbfb116987ae2cc8): bump host-shield windows to 0.10.0 ([#2330](https://github.com/sysdiglabs/charts/issues/2330))
# v1.13.0
### New Features
* **agent,shield,sysdig-deploy** [c1708a09](https://github.com/sysdiglabs/charts/commit/c1708a09161c7b410858ba8b5d346efd7c59108e): release agent 14.1.0 ([#2329](https://github.com/sysdiglabs/charts/issues/2329))
# v1.12.8
### Documentation
* **shield** [51fbd0dc](https://github.com/sysdiglabs/charts/commit/51fbd0dce642a90de73d15b29d7941d5da4e0c86): add more information on when privileged can be disabled. ([#2327](https://github.com/sysdiglabs/charts/issues/2327))
# v1.12.7
### Chores
* **shield** [0e2f4c75](https://github.com/sysdiglabs/charts/commit/0e2f4c75557cdec263ac748eb73e97be92327f96): update README to specify secure api token requirements ([#2259](https://github.com/sysdiglabs/charts/issues/2259))
# v1.12.6
### Bug Fixes
* **shield** [fb017637](https://github.com/sysdiglabs/charts/commit/fb0176372125f24426486343f79da36f041a0b0d): do not set proxy configuration on host-shield when proxy is not configured ([#2319](https://github.com/sysdiglabs/charts/issues/2319))
# v1.12.5
### Bug Fixes
* **shield** [abfcc12b](https://github.com/sysdiglabs/charts/commit/abfcc12b0396d65c207ee64cb70ebc6d5ab030a4): remove unbalanced quote ([#2309](https://github.com/sysdiglabs/charts/issues/2309))
# v1.12.4
### Bug Fixes
* **shield** [157192b0](https://github.com/sysdiglabs/charts/commit/157192b05926c85c4abd3706441365d5eeabbb6e): openshift scc should set allowHostPorts to true when the cluster-shield is set to run on the host network ([#2307](https://github.com/sysdiglabs/charts/issues/2307))
# v1.12.3
### Chores
* **shield** [9a3c5a0c](https://github.com/sysdiglabs/charts/commit/9a3c5a0c8198ab82276ab27bc98b62c765f7a1c1): update docs with rapid response password ([#2306](https://github.com/sysdiglabs/charts/issues/2306))
# v1.12.2
### Chores
* **shield** [642e60fe](https://github.com/sysdiglabs/charts/commit/642e60fec21ef59f326dc0cf11a7338c6cfc1d52): add cluster.volume_snapshot_class default on cluster-shield ([#2300](https://github.com/sysdiglabs/charts/issues/2300))
# v1.12.1
### Chores
* **shield** [563dd11a](https://github.com/sysdiglabs/charts/commit/563dd11a1001119b76439916ccea7220474f5714): handle respond mapping on cluster-shield ([#2299](https://github.com/sysdiglabs/charts/issues/2299))
# v1.12.0
### Chores
* **cluster-shield,shield,sysdig-deploy** [d0784daf](https://github.com/sysdiglabs/charts/commit/d0784dafa3ec6651de22632232cfd0f5e9547c4b): Automatic bump to version 1.13.0 ([#2297](https://github.com/sysdiglabs/charts/issues/2297))
# v1.11.1
### New Features
* **agent,sydig-deploy,shield** [17645dc7](https://github.com/sysdiglabs/charts/commit/17645dc7efdac5d9e422baa89de21f50df2dbc78): release agent 14.0.1 ([#2296](https://github.com/sysdiglabs/charts/issues/2296))
# v1.11.0
### New Features
* **shield** [2b2d78b7](https://github.com/sysdiglabs/charts/commit/2b2d78b77931665aa6e9c319e664db663293f474): pod disruption budget support for the cluster shield ([#2275](https://github.com/sysdiglabs/charts/issues/2275))
# v1.10.0
### Chores
* **shield** [ef94b53d](https://github.com/sysdiglabs/charts/commit/ef94b53d8f655805a0afca228e6be8b806991396): bump host-shield windows to 0.9.0 ([#2295](https://github.com/sysdiglabs/charts/issues/2295))
# v1.9.1
### Chores
* **shield** [ca78c8ad](https://github.com/sysdiglabs/charts/commit/ca78c8adc1a1b4c20f151fe6a2cad289e0daccd9): add support for RCs on windows config checks ([#2293](https://github.com/sysdiglabs/charts/issues/2293))
# v1.9.0
### Chores
* **agent,sysdig-deploy,shield** [43fd8ff4](https://github.com/sysdiglabs/charts/commit/43fd8ff4d53320b6330b3921d6fa6e507abb3436): bump agent to 14.0.0 ([#2277](https://github.com/sysdiglabs/charts/issues/2277))
# v1.8.3
### Chores
* **shield** [c8b0cde7](https://github.com/sysdiglabs/charts/commit/c8b0cde7b8d890050e23a94de383748f0533a23b): add ssl config mapping for windows host-shield ([#2286](https://github.com/sysdiglabs/charts/issues/2286))
# v1.8.2
### Bug Fixes
* **shield** [4becb83a](https://github.com/sysdiglabs/charts/commit/4becb83ad262c67fe12f09522299303d1270cee2): set port 443 on host when alt region is selected ([#2285](https://github.com/sysdiglabs/charts/issues/2285))
# v1.8.1
### Chores
* **shield,cluster-shield,sysdig-deploy** [376fca85](https://github.com/sysdiglabs/charts/commit/376fca85c6f942c2ddc9b494211b29bdddd9b257): Automatic bump to version 1.12.1 ([#2278](https://github.com/sysdiglabs/charts/issues/2278))
# v1.8.0
### Chores
* **cluster-shield,sysdig-deploy,shield** [d76fccf8](https://github.com/sysdiglabs/charts/commit/d76fccf80af45038011114192624b37e81411c64): Automatic bump to version 1.12.0 ([#2272](https://github.com/sysdiglabs/charts/issues/2272))
# v1.7.1
# v1.7.0
### Chores
* **shield** [d49c6020](https://github.com/sysdiglabs/charts/commit/d49c6020c87418233968824ca7e60927fa7d4a71): bump host-shield windows 0.8.0 ([#2268](https://github.com/sysdiglabs/charts/issues/2268))
# v1.6.3
### New Features
* **agent,shield,sysdig-deploy** [a32a879d](https://github.com/sysdiglabs/charts/commit/a32a879d1122dbc533817035b114bb94395876b1): release agent 13.9.2 ([#2264](https://github.com/sysdiglabs/charts/issues/2264))
# v1.6.2
### Chores
* **shield** [ad7d02b3](https://github.com/sysdiglabs/charts/commit/ad7d02b3ceb4a3c408e0e5b2521e32e633cb5388): add cluster name mapping to windows host-shield config ([#2262](https://github.com/sysdiglabs/charts/issues/2262))
# v1.4.1
### New Features
* **shield** [2a3f2d2a](https://github.com/sysdiglabs/charts/commit/2a3f2d2a75827e4742ee79de656e66b79962959b): use secure_light for netsec_enabled ([#2233](https://github.com/sysdiglabs/charts/issues/2233))
# v1.4.0
### New Features
* **agent,shield** [a0aceaa6](https://github.com/sysdiglabs/charts/commit/a0aceaa6c40b30d43678109d43fa5691c2feebc0): release agent 13.9.0 ([#2234](https://github.com/sysdiglabs/charts/issues/2234))
# v1.3.8
### Chores
* **shield** [75351907](https://github.com/sysdiglabs/charts/commit/75351907679b400b286cf6f8883285b8c6ae0f40): add support to rapid_response pwd also on features section ([#2229](https://github.com/sysdiglabs/charts/issues/2229))
# v1.3.7
### Chores
* **shield** [185a2661](https://github.com/sysdiglabs/charts/commit/185a2661e30d2f2df75f02c9c73d6739d54dcd59): add support to rapid_response and response_actions features ([#2221](https://github.com/sysdiglabs/charts/issues/2221))
# v1.3.6
### Chores
* **shield** [289ff486](https://github.com/sysdiglabs/charts/commit/289ff486fa96b82a0d5783eecc2859000b5d53f8): remove default ca_certificate on http_proxy config for windows ([#2228](https://github.com/sysdiglabs/charts/issues/2228))
# v1.3.5
### Chores
* **shield** [308cdece](https://github.com/sysdiglabs/charts/commit/308cdece594e170393852353afdffb893a95543f): bump host-shield windows to 0.7.1 ([#2226](https://github.com/sysdiglabs/charts/issues/2226))
# v1.3.4
### Chores
* **agent,sysdig-deploy,shield** [d9cb1168](https://github.com/sysdiglabs/charts/commit/d9cb11684f11a3d60b8c1346b1dd2c76ba04ae20): add /sys/fs mount ([#2223](https://github.com/sysdiglabs/charts/issues/2223))
# v1.3.3
### Bug Fixes
* **shield** [d1a43057](https://github.com/sysdiglabs/charts/commit/d1a430574b6f0d41de2550daba1696493c4984c5): revert shield chart update ([#2219](https://github.com/sysdiglabs/charts/issues/2219))
# v1.3.2
### New Features
* **shield** [579aa4c4](https://github.com/sysdiglabs/charts/commit/579aa4c423bb1f2e7ed5a456eb557299a8b90c8d): improve regions handling logic to allow override region specific settings without setting region to custom ([#2216](https://github.com/sysdiglabs/charts/issues/2216))
# v1.3.1
### New Features
* **shield** [919709d1](https://github.com/sysdiglabs/charts/commit/919709d1246817ebf6e2b38b8908e032bcbbaf73): Allow configurable DNS Policy for Host Shield ([#2213](https://github.com/sysdiglabs/charts/issues/2213))
# v1.3.0
### Chores
* **cluster-shield** [8df60680](https://github.com/sysdiglabs/charts/commit/8df60680c6ca6888277c60efbdac2fa2532f2810): Automatic bump to version 1.10.0 ([#2208](https://github.com/sysdiglabs/charts/issues/2208))
# v1.2.0
### New Features
* **shield** [fb1452be](https://github.com/sysdiglabs/charts/commit/fb1452be8411019f47b7d8c3901b9f97f4cd2f60): add support for windows host-shield ([#2184](https://github.com/sysdiglabs/charts/issues/2184))
# v1.1.0
### New Features
* **shield** [351986ea](https://github.com/sysdiglabs/charts/commit/351986eae6d9093d454edf744ad92a2ac7eb2361): add host support (universal_ebpf) on gke-autopilot ([#2076](https://github.com/sysdiglabs/charts/issues/2076))
# v1.0.0
### New Features
* **shield** [d2e3a095](https://github.com/sysdiglabs/charts/commit/d2e3a09566344f580a7f89878230cfbe68b1ef82): GA release of the shield chart ([#2202](https://github.com/sysdiglabs/charts/issues/2202))
# v0.10.3
### New Features
* **host-shield** [59118afe](https://github.com/sysdiglabs/charts/commit/59118afec130f35b67d533592a3236ecd5c916fd): add proper container name when unprivileged mode is set ([#2201](https://github.com/sysdiglabs/charts/issues/2201))
# v0.10.2
### New Features
* **agent,shield** [d5f56650](https://github.com/sysdiglabs/charts/commit/d5f56650a4fb76b74f126334445716ff42d6046e): release agent 13.8.1 ([#2197](https://github.com/sysdiglabs/charts/issues/2197))
# v0.10.1
### Chores
* **shield** [f326a300](https://github.com/sysdiglabs/charts/commit/f326a300db4bbb14911bf33d17c122ec76c230ce): bump cluster-shield to 1.9.1 ([#2191](https://github.com/sysdiglabs/charts/issues/2191))
# v0.10.0
### Chores
* **cluster-shield,shield,sysdig-deploy** [638ca265](https://github.com/sysdiglabs/charts/commit/638ca265259e0d350f92e75da063924f00de1bd3): Automatic bump to version 1.9.0 ([#2173](https://github.com/sysdiglabs/charts/issues/2173))
# v0.9.5
### Bug Fixes
* **agent,cluster-shield,node-analyzer,shield,kspm-collector,admission-controller,rapid-response** [f71edde3](https://github.com/sysdiglabs/charts/commit/f71edde32e4f1894bf015b94fe55f4d720b79513): remove unused allowedUnsafeSysctls constraint ([#2005](https://github.com/sysdiglabs/charts/issues/2005))
# v0.9.4
### Chores
* **cluster-shield,shield,sysdig-deploy** [b087bfa5](https://github.com/sysdiglabs/charts/commit/b087bfa5fba13e559a6a9ffbc6c01bd1ca00622b): Automatic bump to version 1.8.2 ([#2168](https://github.com/sysdiglabs/charts/issues/2168))
# v0.9.3
### Chores
* **cluster-shield,shield,sysdig-deploy** [a0a64555](https://github.com/sysdiglabs/charts/commit/a0a645551a9718380cd51ab9ad428b1b660c3528): Automatic bump to version 1.8.1 ([#2164](https://github.com/sysdiglabs/charts/issues/2164))
# v0.9.2
### Bug Fixes
* **shield** [590ce969](https://github.com/sysdiglabs/charts/commit/590ce969048c0e848edad49699cc1509d57e3913): allow audit tap in local forwarder ([#2158](https://github.com/sysdiglabs/charts/issues/2158))
# v0.9.1
### New Features
* **shield** [6d0d6c7d](https://github.com/sysdiglabs/charts/commit/6d0d6c7da344ba0ef17c64b06d3d604dc730072d): reintroduce key rename ([#2157](https://github.com/sysdiglabs/charts/issues/2157))
# v0.9.0
### New Features
* **agent,shield** [534e572c](https://github.com/sysdiglabs/charts/commit/534e572c6b66cce6f270dab07c4bd0b113a38912): release agent 13.8.0 ([#2154](https://github.com/sysdiglabs/charts/issues/2154))
# v0.8.1
### New Features
* **shield** [fb7e2ffa](https://github.com/sysdiglabs/charts/commit/fb7e2ffa7535e1e1b2dd55720680d05e2911b49f): add metrics port when promex is enabled ([#2151](https://github.com/sysdiglabs/charts/issues/2151))
# v0.8.0
### New Features
* **shield** [97157a7e](https://github.com/sysdiglabs/charts/commit/97157a7eb9ba1948ea6373eb6c6ed1d8991bcb4c): cluster shield 1.8.0 ([#2142](https://github.com/sysdiglabs/charts/issues/2142))
# v0.7.0
### New Features
* **shield** [3d75369f](https://github.com/sysdiglabs/charts/commit/3d75369f67f8bfc67f5c04e4be898a793dd5a64b): allow to specify the security context for the Cluster Shield in the shield chart ([#2130](https://github.com/sysdiglabs/charts/issues/2130))
# v0.6.4
### New Features
* **agent,shield** [58350609](https://github.com/sysdiglabs/charts/commit/5835060974d9e807f59a59845ec5228ce98bfe15): release agent 13.7.2 ([#2119](https://github.com/sysdiglabs/charts/issues/2119))
# v0.6.3
### New Features
* **shield** [66f365df](https://github.com/sysdiglabs/charts/commit/66f365df382b47efa21dcd580c26da2769c8e9b8): [SMAGENT-8138] add full securityContext to host-shield chart ([#2114](https://github.com/sysdiglabs/charts/issues/2114))
# v0.6.2
### New Features
* **shield** [78198a3a](https://github.com/sysdiglabs/charts/commit/78198a3a9c842d8fa03dc4e3f2f6398778de5e3b): restore legacy monitoring and responding key names ([#2111](https://github.com/sysdiglabs/charts/issues/2111))
# v0.6.1
### New Features
* **shield** [46850feb](https://github.com/sysdiglabs/charts/commit/46850feb11f0682e3955951b849c360d1d1b58c1): [SMAGENT-8607] Allow for custom security context ([#2112](https://github.com/sysdiglabs/charts/issues/2112))
# v0.6.0
### New Features
* **shield** [0d9dedfb](https://github.com/sysdiglabs/charts/commit/0d9dedfb29b9ce89cf38482c600beb58db75381c): rename monitoring and responding keys ([#2100](https://github.com/sysdiglabs/charts/issues/2100))
# v0.5.1
### Chores
* **cluster-shield,sysdig-deploy,shield** [9edcb32f](https://github.com/sysdiglabs/charts/commit/9edcb32f47d5b3338b15f229d6eadc2cece9492e): Automatic bump to version 1.7.1 ([#2104](https://github.com/sysdiglabs/charts/issues/2104))
# v0.5.0
### Chores
* **shield** [f16b2ed8](https://github.com/sysdiglabs/charts/commit/f16b2ed81b3358b0aab0a7e166906b604a4c0665): bump cluster-shield to v1.7.0 ([#2103](https://github.com/sysdiglabs/charts/issues/2103))
# v0.4.2
### New Features
* **agent,shield** [d8414740](https://github.com/sysdiglabs/charts/commit/d8414740491a7fc39ba85b72ad08d4792e94b734): release agent 13.7.1 ([#2094](https://github.com/sysdiglabs/charts/issues/2094))
# v0.4.1
### New Features
* **shield** [25c29f18](https://github.com/sysdiglabs/charts/commit/25c29f182afa6d910e552f8f70c5d86f5c09c2bc): allow to override capabilities [SMAGENT-8408] ([#2077](https://github.com/sysdiglabs/charts/issues/2077))
# v0.4.0
### Chores
* **shield** [897b64ed](https://github.com/sysdiglabs/charts/commit/897b64ede6de8b2bc9d13e40bf7c909bfb52ba5f): bump cluster-shield to v1.6.0 ([#2075](https://github.com/sysdiglabs/charts/issues/2075))
# v0.3.1
### New Features
* **shield** [a7e2cdcb](https://github.com/sysdiglabs/charts/commit/a7e2cdcba6385b493fe3d113a4274df38d5ac3d0): Introduce Prometheus scrape custom config ([#2067](https://github.com/sysdiglabs/charts/issues/2067))
# v0.3.0
### New Features
* **agent,shield** [e48080ae](https://github.com/sysdiglabs/charts/commit/e48080aee167e1a324e09ff092676378abb4c3f1): release agent 13.7.0 ([#2069](https://github.com/sysdiglabs/charts/issues/2069))
# v0.2.11
### Chores
* **shield** [8f5d7046](https://github.com/sysdiglabs/charts/commit/8f5d7046f2faff0fb719a5c035ff3e28d68a7a5a): replace experimental warning with technical preview notice ([#2060](https://github.com/sysdiglabs/charts/issues/2060))
# v0.2.10
### Bug Fixes
* **shield** [8a7ea104](https://github.com/sysdiglabs/charts/commit/8a7ea1045bc5333196a48b0d24b8815efd27b9cd): reconfigure host shield configmap mounts ([#2055](https://github.com/sysdiglabs/charts/issues/2055))
# v0.2.9
### Bug Fixes
* **shield** [14d4d769](https://github.com/sysdiglabs/charts/commit/14d4d769d2075951a53f7fb932a910649796cea0): configure the host securitycontextconstraint when running on openshift based clusters ([#2054](https://github.com/sysdiglabs/charts/issues/2054))
# v0.2.8
### Bug Fixes
* **shield** [42aa7ad2](https://github.com/sysdiglabs/charts/commit/42aa7ad2c09800ab34207fdbf925dd42ab3dcb18): set /var/data type to DirectoryOrCreate ([#2050](https://github.com/sysdiglabs/charts/issues/2050))
# v0.2.7
### Bug Fixes
* **shield** [4b1be3ec](https://github.com/sysdiglabs/charts/commit/4b1be3ec21baf34529c08386f7460ea804eea725): shorten the service name used for container vulnerability management service ([#2049](https://github.com/sysdiglabs/charts/issues/2049))
# v0.2.6
### Chores
* **shield** [bf1bf76b](https://github.com/sysdiglabs/charts/commit/bf1bf76b5110bdf185b42b353c9ac0ff8c7e1c82): remove other as accepted value for cluster_type ([#2044](https://github.com/sysdiglabs/charts/issues/2044))
# v0.2.5
### Chores
* **shield** [d0ad363b](https://github.com/sysdiglabs/charts/commit/d0ad363b2c9e3302f51f3961092f40dba81281c9): improve values and their descriptions ([#2043](https://github.com/sysdiglabs/charts/issues/2043))
# v0.2.4
### New Features
* **shield** [d0029fe2](https://github.com/sysdiglabs/charts/commit/d0029fe26e4cb394c3ad53e40c0dad5a672f7b1a): validate proxy protocols via values schema ([#2041](https://github.com/sysdiglabs/charts/issues/2041))
# v0.2.3
### New Features
* **shield** [0dd9ffd6](https://github.com/sysdiglabs/charts/commit/0dd9ffd6b518d7e165a0df4a2b49bbb42831c25c): only specify collector port if given in config ([#2042](https://github.com/sysdiglabs/charts/issues/2042))
# v0.2.2
### New Features
* **shield** [c5aff8b5](https://github.com/sysdiglabs/charts/commit/c5aff8b51d8456bfe5f7cba9924e153548d4bda9): enable kubernetes-metadata by default and decrease delegated nodes number to 0 ([#2038](https://github.com/sysdiglabs/charts/issues/2038))
# v0.2.1
### Bug Fixes
* **shield** [7575efd3](https://github.com/sysdiglabs/charts/commit/7575efd3001caf0e00abf2edf88dd855e8945e24): correct typo in captures enablement ([#2040](https://github.com/sysdiglabs/charts/issues/2040))
# v0.2.0
### New Features
* **shield** [e5a03f7c](https://github.com/sysdiglabs/charts/commit/e5a03f7c3394b9df4fd9c6e6802cf7597365052b): release host shield 13.6.1 ([#2039](https://github.com/sysdiglabs/charts/issues/2039))
# v0.1.21
### Chores
* **sysdig-deploy,shield** [4d9a268f](https://github.com/sysdiglabs/charts/commit/4d9a268fb941a3bf737131238c6207ef4ec0fc6b): Automatic version bump due to updated dependencies ([#2037](https://github.com/sysdiglabs/charts/issues/2037))
# v0.1.20
### New Features
* **shield** [cbfdb4b6](https://github.com/sysdiglabs/charts/commit/cbfdb4b6e5410afa5f4834c0cd8413497af33fb8): set host shield to secure_light by default ([#2035](https://github.com/sysdiglabs/charts/issues/2035))
# v0.1.19
### Chores
* **shield** [fbcda7fa](https://github.com/sysdiglabs/charts/commit/fbcda7faebc03e0ee8796a96677dcdc5af2c26a6): add webhook/checksum on cluster deployment ([#2033](https://github.com/sysdiglabs/charts/issues/2033))
# v0.1.18
### Bug Fixes
* **shield** [bd7667cc](https://github.com/sysdiglabs/charts/commit/bd7667cc6f8035cfb31d79a303a8bd45d65b5564): avoid merge with main context ([#2030](https://github.com/sysdiglabs/charts/issues/2030))
# v0.1.17
### Bug Fixes
* **shield** [be56023d](https://github.com/sysdiglabs/charts/commit/be56023d573681925e68e4b49a99f2a6993437f0): add lease rule for host shield role ([#2034](https://github.com/sysdiglabs/charts/issues/2034))
# v0.1.16
### Bug Fixes
* **shield** [28d8ae0e](https://github.com/sysdiglabs/charts/commit/28d8ae0ebb8d2c8ca718b386fe69ecda5d90a603): update custom CA path in host shield config ([#2029](https://github.com/sysdiglabs/charts/issues/2029))
# v0.1.15
### Bug Fixes
* **shield** [d805ca07](https://github.com/sysdiglabs/charts/commit/d805ca07f7065da88ecb783f6deb8752d0f27c28): touch up custom port formatting ([#2026](https://github.com/sysdiglabs/charts/issues/2026))
# v0.1.14
### Chores
* **shield** [1a9e6aa2](https://github.com/sysdiglabs/charts/commit/1a9e6aa20ca53d6525e7da2842f8aa543a636ae1): bump cluster-shield to v1.5.0 ([#2016](https://github.com/sysdiglabs/charts/issues/2016))
# v0.1.13
### Bug Fixes
* **shield** [ffced55c](https://github.com/sysdiglabs/charts/commit/ffced55c860c3cf5bcf0e6d79029003491da144b): add pull secrets to host shield daemonset ([#2007](https://github.com/sysdiglabs/charts/issues/2007))
# v0.1.12
### New Features
* **agent,sysdg-deploy,shield** [aa507cd5](https://github.com/sysdiglabs/charts/commit/aa507cd50bde037ec9c407dd7282677641beafaa): release agent 13.5.0 ([#2000](https://github.com/sysdiglabs/charts/issues/2000))
# v0.1.11
### Bug Fixes
* **shield** [a08bf371](https://github.com/sysdiglabs/charts/commit/a08bf3714862664370d5584a14eeb3a41b1ad7e0): apply kspm_analyzer agent app name ([#1999](https://github.com/sysdiglabs/charts/issues/1999))
# v0.1.10
### Bug Fixes
* **shield** [501061f4](https://github.com/sysdiglabs/charts/commit/501061f4753696f6f7ef12888eeecbf242091891): add env var and port to host shield container ([#1995](https://github.com/sysdiglabs/charts/issues/1995))
# v0.1.9
### Bug Fixes
* **shield** [46e8c875](https://github.com/sysdiglabs/charts/commit/46e8c875fbed6a29b9ce3dd03905e643c62ca626): Fix wrong config file name ([#1994](https://github.com/sysdiglabs/charts/issues/1994))
# v0.1.8
### Bug Fixes
* **shield** [aa91cf17](https://github.com/sysdiglabs/charts/commit/aa91cf17a79b6cc952a069106b7db1377834cd99): Fix cluster name & execute unit test in CI for the shield chart ([#1986](https://github.com/sysdiglabs/charts/issues/1986))
# v0.1.7
### New Features
* **shield** [b4aac2cc](https://github.com/sysdiglabs/charts/commit/b4aac2cc07965aaa5e91b33568a042cc16b8bf9c): add local forwarder support to host shield  in shield chart ([#1972](https://github.com/sysdiglabs/charts/issues/1972))
# v0.1.6
### New Features
* **shield** [af7d38c5](https://github.com/sysdiglabs/charts/commit/af7d38c5d38d51d7d96077c076e8b0234a4aa72c): allow custom env vars and volume mounts ([#1974](https://github.com/sysdiglabs/charts/issues/1974))
# v0.1.5
### Bug Fixes
* **shield** [8e5567de](https://github.com/sysdiglabs/charts/commit/8e5567de21f80bc1fad05d46aa7cf1deed31ef95): add default host shield tolerations and affinity ([#1968](https://github.com/sysdiglabs/charts/issues/1968))
# v0.1.4
### Bug Fixes
* **shield** [3389a4e4](https://github.com/sysdiglabs/charts/commit/3389a4e4683f4e96222ff06f14ad5a8354922e7c): allow accesskey to be null in case access_key_existing_secret is set ([#1969](https://github.com/sysdiglabs/charts/issues/1969))
# v0.1.3
### Chores
* **cluster-shield,sysdig-deploy,shield** [f718a4e7](https://github.com/sysdiglabs/charts/commit/f718a4e7b6164a306919531120ad9cbf938c6424): bump cluster-shield to version 1.4.0 ([#1967](https://github.com/sysdiglabs/charts/issues/1967))
# v0.1.2
### Bug Fixes
* **shield** [a2a59670](https://github.com/sysdiglabs/charts/commit/a2a596707f6e2a3d819ce9e7d49048237bedbb2e): README.md table not formatted properly ([#1965](https://github.com/sysdiglabs/charts/issues/1965))
# v0.1.1
### Bug Fixes
* **shield** [babb2ae7](https://github.com/sysdiglabs/charts/commit/babb2ae7de30849504567140b7f6b984a912800e): add missing CHANGELOG.md file ([#1964](https://github.com/sysdiglabs/charts/issues/1964))
### Chores
* **shield** [4580d6f7](https://github.com/sysdiglabs/charts/commit/4580d6f7e9cbead6cfb5f5ba3a76ad9f8529ae46): release experimental 0.1.0 version ([#1963](https://github.com/sysdiglabs/charts/issues/1963))
# v0.1.0
### Chores
* **shield** [4580d6f7](https://github.com/sysdiglabs/charts/commit/4580d6f7e9cbead6cfb5f5ba3a76ad9f8529ae46): release experimental 0.1.0 version ([#1963](https://github.com/sysdiglabs/charts/issues/1963))
