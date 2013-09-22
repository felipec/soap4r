require 'test/unit'
require 'soap/rpc/driver'
require File.expand_path('../server2.rb', __FILE__)


module SOAP
module Calc


class TestCalc2 < Test::Unit::TestCase
  Port = 17171

  def setup
    @server = CalcServer2.new('CalcServer', 'http://tempuri.org/calcService', '0.0.0.0', Port)
    @server.level = Logger::Severity::ERROR
    @t = Thread.new {
      Thread.current.abort_on_exception = true
      @server.start
    }
    @endpoint = "http://localhost:#{Port}/"
    @var = SOAP::RPC::Driver.new(@endpoint, 'http://tempuri.org/calcService')
    @var.wiredump_dev = STDERR if $DEBUG
    @var.add_method('set_value', 'newValue')
    @var.add_method('get_value')
    @var.add_method_as('+', 'add', 'rhs')
    @var.add_method_as('-', 'sub', 'rhs')
    @var.add_method_as('*', 'multi', 'rhs')
    @var.add_method_as('/', 'div', 'rhs')
  end

  def teardown
    @server.shutdown if @server
    if @t
      @t.kill
      @t.join
    end
    @var.reset_stream if @var
  end

  def test_calc2
    assert_equal(1, @var.set_value(1))
    assert_equal(3, @var + 2)
    assert_equal(-1.2, @var - 2.2)
    assert_equal(2.2, @var * 2.2)
    assert_equal(0, @var / 2)
    assert_equal(0.5, @var / 2.0)
    assert_raises(ZeroDivisionError) do
      @var / 0
    end
  end
end


end
end
