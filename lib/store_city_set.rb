class StoreCitySet 
  attr_reader :state
  attr_reader :city
   
  def initialize(attributes) 
    @city = attributes[:city] 
    @state = attributes[:state]
  end 
  
  def self.from_xml(xml) 
    new( :city => xml.css("City").text,
    :state => xml.css("State").text) 
  end 
end

