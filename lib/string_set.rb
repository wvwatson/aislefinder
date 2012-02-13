class StringSet 
  attr_reader :product_name 
  def initialize(attributes) 
    @product_name = attributes[:product_name] 
  end 
  
  def self.from_xml(xml) 
    new(:product_name => xml.text)
  end 
end