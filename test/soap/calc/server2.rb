#!/usr/bin/env ruby

require 'soap/rpc/standaloneServer'
require File.expand_path('../calc2.rb', __FILE__)

class CalcServer2 < SOAP::RPC::StandaloneServer
  def on_init
    servant = CalcService2.new
    add_method(servant, 'set_value', 'newValue')
    add_method(servant, 'get_value')
    add_method_as(servant, '+', 'add', 'lhs')
    add_method_as(servant, '-', 'sub', 'lhs')
    add_method_as(servant, '*', 'multi', 'lhs')
    add_method_as(servant, '/', 'div', 'lhs')
  end
end

if $0 == __FILE__
  status = CalcServer2.new('CalcServer', 'http://tempuri.org/calcService', '0.0.0.0', 17171).start
end
