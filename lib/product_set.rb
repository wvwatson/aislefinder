class ProductSet 
  attr_reader :item_name, :item_description, :item_category, :item_id, :item_image, :aisle_number 
  def initialize(attributes) 
    @item_name = attributes[:item_name] 
    @item_description = attributes[:item_description] 
    @item_category = attributes[:item_category] 
    @item_id = attributes[:item_id] 
    @item_image = attributes[:item_image] 
    @aisle_number = attributes[:aisle_number] 
  end 
  
  def self.from_xml(xml) 
    new( :item_name => xml.css("Itemname").text, 
         :item_description => xml.css("ItemDescription").text,
         :item_category => xml.css("ItemCategory").text,
         :item_id => xml.css("ItemID").text,
         :item_image => xml.css("ItemImage").text,
         :aisle_number => xml.css("AisleNumber").text) 
  end 
end

