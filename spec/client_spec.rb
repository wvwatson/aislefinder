require 'aislefinder'
require 'spec_helper'

describe "client" do 

  before(:each) do
    AisleFinder.base_uri = 'http://www.SupermarketAPI.com/api.asmx'
    AisleFinder.apikey = 'YOURAPIKEYHERE'
  end
  
  it "should get a product by name" do 
    products = AisleFinder.find_by_product_name("Parsley") 
    products.first.item_name.should match /Mccormick Parsley Flake Gourmet/ 
    # test other item 
  end
   
  it "gettting a product by name should return nil for a product not found" do 
    AisleFinder.find_by_product_name("ParsleyFromMars").should be_nil 
  end 

  it "should get a product by it's Id" do
    products = AisleFinder.find_by_product_id("32372")
    products.first.item_name.should match /Mccormick Parsley Flake Gourmet/
  end
  
  it "gettting a product by Id should return nil for a product not found" do 
    AisleFinder.find_by_product_id("12345").should be_nil 
  end
  
  it "should return all U.S. States" do
    AisleFinder.find_all_us_states.first.state.should match /AL/
  end
  
  it "should return cities by state" do
    AisleFinder.find_cities_by_state("CA").first.city.should match /Anderson/
  end
  
  it "should return product names by their full name" do
    AisleFinder.find_product_names_by_full_name("Apple").first.product_name.should match /Apples/
  end
  
  it "should return stores by name" do
     AisleFinder.find_stores_by_name("Safeway").first.store_name.should match /Safeway/
   end
  
  it "should return products by store id" do
    AisleFinder.find_products_by_store_id("b97153fc14", "Apple").first.item_name.should match /Apples/
  end
  
  it "should return stores by city and state" do
    AisleFinder.find_stores_by_city_and_state("San Francisco", "CA").first.store_name.should match /Safeway/
  end
  
  it "should return stores by zip" do
    AisleFinder.find_stores_by_zip("95130").first.store_name.should match /Luckys/
  end
end

