# Chart: Shield

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
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
