#coding : utf-8
require 'test/unit'

require './lib/xsd/iconvcharset'

module XSD

  class TestIconvCharset < Test::Unit::TestCase
    def test_normal_ascii
      test = "abcdefghijklmnopqrsut"
      assert_equal test, IconvCharset.safe_iconv('cp932', 'utf-8', test)
    end
    def test_utf8
      test = "\xff\xfe1\0\x16\x202\0"
      assert_equal "1‖2", IconvCharset.safe_iconv('utf-8', 'utf-16', test)
    end
    def test_illegal
      test = "abcde\xff\xfefghijklmnopqr\x80sut"
      assert_equal "abcde??fghijklmnopqr?sut", IconvCharset.safe_iconv('utf-8', 'cp932', test)
    end
    def test_undef
      test = "\xff\xfe1\0\x16\x202\0".encode('utf-8', 'utf-16')
      assert_equal "1?2", IconvCharset.safe_iconv('cp932', 'utf-8', test)
    end
  end

end
