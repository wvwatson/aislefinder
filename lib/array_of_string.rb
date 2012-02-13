require 'string_set'

class ArrayOfString
  attr_reader :string_sets
  def initialize(string_sets)
    @string_sets = string_sets
  end
  
  def self.parse(xml)
    # debugger
    # doc = Nokogiri::XML(xml) 
    sets = xml.css("ArrayOfString > string").map do |product_name| 
      StringSet.from_xml(product_name) 
    end 
    new(sets)
  end

end
