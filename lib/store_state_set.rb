class StoreStateSet 
  attr_reader :state 
  def initialize(attributes) 
    @state = attributes[:state] 
  end 
  
  def self.from_xml(xml) 
    new( :state => xml.css("State").text) 
  end 
end

