# Chart: Shield

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
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
