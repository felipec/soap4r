# XSD4R - REXMLParser XML parser library.
# Copyright (C) 2000-2007  NAKAMURA, Hiroshi <nahi@ruby-lang.org>.

# This program is copyrighted free software by NAKAMURA, Hiroshi.  You can
# redistribute it and/or modify it under the same terms of Ruby's license;
# either the dual license version in 2003, or any later version.


require 'xsd/xmlparser'
require 'rexml/streamlistener'
require 'rexml/document'


module XSD
module XMLParser


class REXMLParser < XSD::XMLParser::Parser
  include REXML::StreamListener

  def do_parse(string_or_readable)
    source = nil
    source = REXML::SourceFactory.create_from(string_or_readable)
    source.read if source.respond_to?(:read) #Becaise SourceFactory consumes first 3 chars
    source.encoding = charset if charset
    # Listener passes a String in utf-8.
    @charset = 'utf-8'
    REXML::Document.parse_stream(source, self)
  end

  def epilogue
  end

  def tag_start(name, attrs)
    start_element(name, attrs)
  end

  def tag_end(name)
    end_element(name)
  end

  def text(text)
    characters(text)
  end

  def cdata(content)
    characters(content)
  end

  def xmldecl(version, encoding, standalone)
    # Version should be checked.
  end

  add_factory(self)
end


end
end
