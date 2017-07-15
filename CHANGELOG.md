#Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## Unreleased
### Added
- Ruby 2.4.1 testing

## [1.0.0] - 2016-10-31
### Added
- Ruby 2.3.0 support

### Removed
- Ruby 1.9.3 support

### Changed
- Update to rubocop 0.40 and cleanup

### Fixed
- metrics-nut.rb: exclude stderr to remove "Init SSL without certificate database" messages from the output

## [0.1.1] - 2016-02-28
### Added
- new certs

## [0.1.0] - 2016-01-28
### Added
- Apcupsd checks for battery time and levels
- initial release of this sensu plugin repo

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-ups/compare/1.0.0...HEAD
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-ups/compare/0.1.1...1.0.0
[0.1.1]: https://github.com/sensu-plugins/sensu-plugins-ups/compare/0.1.1...0.1.1
