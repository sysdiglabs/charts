# Chart: Cluster Scanner

All notable changes to this chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

Please note that it's automatically updated vía github actions.
Manual edits are supported only below '## Change Log' and should be used
exclusively to fix incorrect entries and not to add new ones.

## Change Log
# v0.8.0
### New Features
* **cluster-scanner** [23b421c6](https://github.com/sysdiglabs/charts/commit/23b421c60dafe24c2e777f38c490e7f88c2c42a4): Enable platform services only in regions which support them ([#1413](https://github.com/sysdiglabs/charts/issues/1413))
# v0.7.2
### Bug Fixes
* **cluster-scanner** [9b3864ff](https://github.com/sysdiglabs/charts/commit/9b3864fffdc9e8b7e8fdc96f8ed4902f945c34c7): removed unneeded version compatibility checks ([#1404](https://github.com/sysdiglabs/charts/issues/1404))
# v0.7.1
### Bug Fixes
* **common,agent,admission-controller,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [e76f1c17](https://github.com/sysdiglabs/charts/commit/e76f1c17e48491dd8ea21293ec1fed2619eed204): Update Sysdig CA ([#1393](https://github.com/sysdiglabs/charts/issues/1393))
# v0.7.0
### New Features
* **cluster-scanner** [5b1e9649](https://github.com/sysdiglabs/charts/commit/5b1e96497ef50342055f3f43bc9ff5f41f7cfea1): added configuration for docker registry mirrors ([#1372](https://github.com/sysdiglabs/charts/issues/1372))
# v0.6.1
### Bug Fixes
* **cluster-scanner** [3fe6f6e6](https://github.com/sysdiglabs/charts/commit/3fe6f6e659e43dfdaaf5211b34f32025283c2b18): corrected incompatibility with helm 3.9 ([#1383](https://github.com/sysdiglabs/charts/issues/1383))
# v0.6.0
### New Features
* **cluster-scanner** [e902c74b](https://github.com/sysdiglabs/charts/commit/e902c74bf1f3ae5c52a19f811bb05acd23bbbb27): enable backend scanning with platform services ([#1369](https://github.com/sysdiglabs/charts/issues/1369))
# v0.5.6
### New Features
* **cluster-scanner** [d44e1f6f](https://github.com/sysdiglabs/charts/commit/d44e1f6fbb46a9565ed5a6da5b4732e11a03ecef): Introduce support to external secrets accessKeySecret ([#1287](https://github.com/sysdiglabs/charts/issues/1287))
# v0.5.5
### New Features
* **cluster-scanner** [b4b4e295](https://github.com/sysdiglabs/charts/commit/b4b4e295bc056c1abccaf5dba8cfdd717b433d12): Add dynamic envs to values ([#1358](https://github.com/sysdiglabs/charts/issues/1358))
# v0.5.4
### Chores
* **cluster-scanner** [7b06c377](https://github.com/sysdiglabs/charts/commit/7b06c3779a3c2a5b2c30a0afaef0ea33ceeb236c): bump RSI and ISE to v0.4.4 ([#1357](https://github.com/sysdiglabs/charts/issues/1357))
# v0.5.3
### New Features
* **admission-controller,agent,cluster-scanner,kspm-collector,node-analyzer,rapid-response** [32231059](https://github.com/sysdiglabs/charts/commit/322310597ffbf9e47b5755be8f2f65a6e68296a2): pass agent tags to kspm components ([#1333](https://github.com/sysdiglabs/charts/issues/1333))
# v0.5.2
### Chores
* **cluster-scanner** [16569cfe](https://github.com/sysdiglabs/charts/commit/16569cfe19ee5880bf67f1f7933fefde170582da): bumped RSI and ISE to latest version 0.4.3 ([#1329](https://github.com/sysdiglabs/charts/issues/1329))
# v0.5.1
### Bug Fixes
* **cluster-scanner** [89d49754](https://github.com/sysdiglabs/charts/commit/89d49754c08f2597157fbe53a0be9faf708a0de3): corrected parsing of onPremCompatibilityVersion param ([#1323](https://github.com/sysdiglabs/charts/issues/1323))
# v0.5.0
### New Features
* **cluster-scanner** [f9db25eb](https://github.com/sysdiglabs/charts/commit/f9db25eb77d6f648adefbf01ad3df983c41ddf70): allow to configure http proxy ([#1302](https://github.com/sysdiglabs/charts/issues/1302))
# v0.4.1
### Documentation
* **admission-controller, cluster-scanner, registry-scanner, cloud-connector, node-analyzer, rapid-response, sysdig-deploy, agent** [df733e62](https://github.com/sysdiglabs/charts/commit/df733e6294eae1967197e3521473a5fab0282b67): update maintainers list ([#1283](https://github.com/sysdiglabs/charts/issues/1283))
# v0.4.0
### New Features
* **sysdig-agent,node-analyzer,kspm-collector,rapid-response,admission-controller** [2dca8e7c](https://github.com/sysdiglabs/charts/commit/2dca8e7c5308e76c2da63c974ae75c4ad510c201): Global Custom CA Bundle Support ([#961](https://github.com/sysdiglabs/charts/issues/961))
# v0.3.3
### Bug Fixes
* **cluster-scanner** [cd8ebe99](https://github.com/sysdiglabs/charts/commit/cd8ebe99dd5313465b5a6cc1cf096cefea71df07): corrected role to support OKD4 ([#1247](https://github.com/sysdiglabs/charts/issues/1247))
# v0.3.2
### Bug Fixes
* **cluster-scanner** [8b44c94f](https://github.com/sysdiglabs/charts/commit/8b44c94fe9e1bdeb21f8815ebcfdd60f6cf8f802): corrected description ([#1243](https://github.com/sysdiglabs/charts/issues/1243))
# v0.3.1
### Bug Fixes
* **common** [0e37805f](https://github.com/sysdiglabs/charts/commit/0e37805f0190b74b53f7d9b47e5528009f58aa4b): add missing CHANGELOG file and bump version ([#1223](https://github.com/sysdiglabs/charts/issues/1223))
### New Features
* **admission-controller,agent,common,kspm-collector,node-analyzer,rapid-response,sysdig-deploy** [47483bc0](https://github.com/sysdiglabs/charts/commit/47483bc0d5f872bc6d406a48491ac930d1d75f8f): Improve region resolution in all charts ([#946](https://github.com/sysdiglabs/charts/issues/946))
# v0.1.3
### Bug Fixes
* **cluster-scanner** [8c17f6d8](https://github.com/sysdiglabs/charts/commit/8c17f6d895fcce3f3fa6d35e74c8b9a43530f60b): updated ISE minimum CPU request ([#1222](https://github.com/sysdiglabs/charts/issues/1222))
# v0.1.2
### Bug Fixes
* [72021049](https://github.com/sysdiglabs/charts/commit/720210497940ddd2119491d28dde163f2bdcb55e): adjust RELEASE-NOTES template to avoid extra new lines at the end of the file ([#1216](https://github.com/sysdiglabs/charts/issues/1216))
# v0.1.1
### Chores
* **cluster-scanner** [c952eb44](https://github.com/sysdiglabs/charts/commit/c952eb44af7a45d9a09ed447eebc7cc54b5d1f21): added missing CHANGELOG.md, improved cluster scanner chart. ([#1215](https://github.com/sysdiglabs/charts/issues/1215))
### New Features
* **cluster-scanner** [f9d0dc59](https://github.com/sysdiglabs/charts/commit/f9d0dc595b6c7e926021e7be4b02e0a5c9f6a46b): init chart with minimal templates and configuration ([#1056](https://github.com/sysdiglabs/charts/issues/1056))
# v0.1.0
### New Features
* **cluster-scanner** [f9d0dc59](https://github.com/sysdiglabs/charts/commit/f9d0dc595b6c7e926021e7be4b02e0a5c9f6a46b): init chart with minimal templates and configuration ([#1056](https://github.com/sysdiglabs/charts/issues/1056))
