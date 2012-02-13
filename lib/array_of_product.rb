require 'product_set'

class ArrayOfProduct
  attr_reader :product_sets
  def initialize(product_sets)
    @product_sets = product_sets
  end
  
  def self.parse(xml)
    # debugger
    # doc = Nokogiri::XML(xml) 
    sets = xml.css("ArrayOfProduct > Product").map do |product| 
      ProductSet.from_xml(product) 
    end 
    new(sets)
  end

end
