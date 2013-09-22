require File.expand_path('../mysample_mapping_registry.rb', __FILE__)

module XSD; module XSD2Ruby

class MysampleMapper < XSD::Mapping::Mapper
  def initialize
    super(MysampleMappingRegistry::Registry)
  end
end

end; end
