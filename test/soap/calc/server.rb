#!/usr/bin/env ruby

require 'soap/rpc/standaloneServer'
require File.expand_path('../calc.rb', __FILE__)

class CalcServer < SOAP::RPC::StandaloneServer
  def initialize(*arg)
    super

    servant = CalcService
    add_servant(servant, 'http://tempuri.org/calcService')
  end
end

if $0 == __FILE__
  status = CalcServer.new('CalcServer', nil, '0.0.0.0', 17171).start
end
