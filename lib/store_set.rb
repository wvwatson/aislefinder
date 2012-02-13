class StoreSet 
  
  attr_reader :store_name
  attr_reader :address
  attr_reader :city
  attr_reader :state
  attr_reader :zip
  attr_reader :phone
  attr_reader :storeid
             
  def initialize(attributes) 
    @store_name = attributes[:store_name] 
    @address = attributes[:address]
    @city = attributes[:city]
    @state = attributes[:state]    
    @zip = attributes[:zip]
    @phone = attributes[:phone]
    @storeid = attributes[:storeid]    
  end 
  
  def self.from_xml(xml) 
    new( :store_name => xml.css("Storename").text,
        :address => xml.css("Address").text,
        :city => xml.css("City").text,
        :state => xml.css("State").text,
        :zip => xml.css("Zip").text,
        :phone => xml.css("Phone").text,
        :storeid => xml.css("StoreId").text) 
  end 
end

