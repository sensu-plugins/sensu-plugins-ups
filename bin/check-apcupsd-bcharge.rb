#!/usr/bin/env ruby
#
#   check-apcupsd-bcharge.rb
#
# DESCRIPTION:
#   Checks the battery charge level on a APC UPS using apcupsd <http://www.apcupsd.org>
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
# check-apcupsd-bcharge.rb -w 80 -c 20
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
         proc: proc { |a| a.to_i },
         default: 80,
         description: 'Warn if lower then arg'

  option :crit,
         short: '-c CRIT',
         long: '--critical CRIT',
         proc: proc { |a| a.to_i },
         default: 20,
         description: 'Critical if lower then arg'

  def run
    # Path to apcaccess
    apcaccess = '/sbin/apcaccess'
    results = (`#{apcaccess} status | grep -i bcharge | awk '{print $3}' | awk -F'.' '{print $1}'`).to_i

    if results < config[:crit]
      critical "UPS Battery Charge is at #{results}%"
    elsif results < config[:warn]
      warning "UPS Battery Charge is at #{results}%"
    else
      ok "UPS Battery Charge is at #{results}%"
    end
  end
end
