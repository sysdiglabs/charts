# What's Changed

### New Features
- **node-analyzer** [fd600e8](https://github.com/sysdiglabs/charts/commit/fd600e86b1d28f141ca59439bc687c31fdc141b1): add extraVolumes to daemonset with nodeAnalyzer.extraVolumes.volumes

    * adds new option `nodeAnalyzer.extraVolumes.volumes`. This allows to define volumes for the nodeAnalyzer daemonset in a cleaner way.
Previously it was necessary to use the option `nodeAnalyzer.imageAnalyzer.extraVolumes.volumes`.

#### Full diff: https://github.com/sysdiglabs/charts/compare/node-analyzer-1.8.42...node-analyzer-1.8.43
