require File.expand_path('../echo_version.rb', __FILE__)
require 'soap/mapping'

module Echo_versionMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new
  NsSimpletypeRpcType = "urn:example.com:simpletype-rpc-type"

  EncodedRegistry.register(
    :class => Version_struct,
    :schema_type => XSD::QName.new(NsSimpletypeRpcType, "version_struct"),
    :schema_element => [
      ["version", ["Version", XSD::QName.new(nil, "version")]],
      ["msg", ["SOAP::SOAPString", XSD::QName.new(nil, "msg")]]
    ]
  )

  EncodedRegistry.register(
    :class => Version,
    :schema_type => XSD::QName.new(NsSimpletypeRpcType, "version")
  )

  LiteralRegistry.register(
    :class => Version_struct,
    :schema_type => XSD::QName.new(NsSimpletypeRpcType, "version_struct"),
    :schema_element => [
      ["version", ["Version", XSD::QName.new(nil, "version")]],
      ["msg", ["SOAP::SOAPString", XSD::QName.new(nil, "msg")]]
    ]
  )

  LiteralRegistry.register(
    :class => Version,
    :schema_type => XSD::QName.new(NsSimpletypeRpcType, "version")
  )
end
