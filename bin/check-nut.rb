#!/usr/bin/env ruby
# encoding: utf-8
#
#   check-nut
#
# DESCRIPTION:
#   This plugin checks the status of UPS units managed by NUT (http://www.networkupstools.org/)
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   *nix systems
#
# DEPENDENCIES:
#   gem: sensu-plugin
#
# USAGE:
#   ./check-nut.rb
#   NutCheck OK: tripplite: status "OL"
#
# LICENSE:
#   Copyright 2015 Tim Smith (tim@cozy.co) - Cozy Services Ltd.
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.

require 'sensu-plugin/check/cli'

#
# Check Whois domain expiration
#
class NutCheck < Sensu::Plugin::Check::CLI
  # check the status of each UPS managed by nut
  def parse_status
    status = {}
    status['ok'] = {}
    status['critical'] = {}
    instances = `upsc -l 2> /dev/null`.split("\n")
    instances.each do |ups|
      output = `upsc #{ups} 2> /dev/null`.split("\n")
      output.each do |line|
        next unless /ups.status: (.+)/ =~ line
        if $1 == 'OL'
          status['ok'][ups] = $1
        else
          status['critical'][ups] = $1
        end
        break
      end
    end
    status
  end

  def run
    status = parse_status
    if status['critical'].empty? && status['ok'].empty?
      unknown 'Error detecting UPS units managed by NUT'
    elsif status['critical'].empty?
      ok "#{status['ok'].map { |x| x[0] }.join(',')}: status \"OL\""
    else
      critical status['critical'].map { |u, v| "#{u} status:#{v}" }.join(',')
    end
  end
end
