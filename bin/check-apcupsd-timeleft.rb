#!/usr/bin/env ruby
#
#   check-apcupsd-timeleft.rb
#
# DESCRIPTION:
#   Checks the battery time on a APC UPS using apcupsd <http://www.apcupsd.org>
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   apcupsd <http://www.apcupsd.org>
#
# USAGE:
# check-apcupsd-timeleft.rb -w 5 -c 2
#
# LICENSE:
#   Copyright 2016 Drew Rogers  <drogers@chariotsolutions.com> - Chariot Solutions LLC
#
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/check/cli'

class CheckApcupsd < Sensu::Plugin::Check::CLI

  option :warn,
    short: '-w WARN',
    long: '--warn WARN',
    :proc => proc {|a| a.to_i },
    default: 5,
    description: 'Warn if battery time is less then arg'

  option :crit,
    short: '-c CRIT',
    long: '--critical CRIT',
    :proc => proc {|a| a.to_i },
    default: 2,
    description: 'Critical if battery time is less then arg'

  def run
    # Path to apcaccess
    apcaccess = '/sbin/apcaccess'
    results = (%x[#{apcaccess} status | grep -i timeleft | awk '{print $3}' | awk -F'.' '{print $1}' ]).to_i    

    if results <= config[:warn] and results > config[:crit]
      warning "UPS Battery time is #{results} minutes"
    elsif results < config[:crit]
      critical "UPS Battery time is #{results} minutes"
    else
      ok "UPS Battery time is #{results} minutes"
    end
  end
end
