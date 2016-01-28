## Sensu-Plugins-ups
[ ![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-ups.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-ups)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-ups.svg)](http://badge.fury.io/rb/sensu-plugins-ups)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-ups/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-ups)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-ups/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-ups)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-ups.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-ups)
## Functionality

**check-nut**

Checks each NUT (http://www.networkupstools.org/) managed UPS unit for the "OL" status

**metrics-nut**

Polls metrics from NUT (http://www.networkupstools.org/) monitored UPS units

 **apcupsd checks**

 Uses apcupsd (http://www.apcupsd.org/) to check battery time and levels

## Files
 * bin/check-nut.rb
 * bin/metrics-nut.rb
 * bin/check-apcupsd-bcharge.rb
 * bin/check-apcupsd-timeleft.rb

## Usage

**check-apcupsd-timeleft**
```
{
  "checks": {
    "check-apcupsd-timeleft": {
      "command": "check-apcupsd-timeleft.rb -w 5 -c 1"
    }
  }
}
```

**check-apcupsd-bcharge**
```
{
  "checks": {
    "check-apcupsd-bcharge": {
      "command": "check-apcupsd-bcharge.rb -w 80 -c 50"
    }
  }
}
```


## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)

## Notes

