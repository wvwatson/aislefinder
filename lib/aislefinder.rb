require 'rubygems'
require 'bundler/setup' 
require 'typhoeus'
require 'nokogiri'
require 'array_of_product'
require 'array_of_store_state'
require 'array_of_store_city'
require 'array_of_string'
require 'array_of_store'
require 'cgi'

class FoodFinder
  
  class << self; 
    attr_accessor :base_uri 
    attr_accessor :apikey
  end 
  
  def self.find_by_product_name(name) 
    # http://www.SupermarketAPI.com/api.asmx/SearchByProductName?APIKEY=APIKEY&ItemName=Parsley
    response = Typhoeus::Request.get( "#{base_uri}/SearchByProductName?APIKEY=#{apikey}&ItemName=#{name}") 
    if response.code == 200 
      doc = Nokogiri::XML(response.body)
      array_of_products = ArrayOfProduct.parse(doc)
      
      # should be a 404 (not found) :(
      if array_of_products.product_sets && array_of_products.product_sets.first.item_name != 'NOITEM'
        array_of_products.product_sets
      else
        nil
      end
    elsif response.code == 404
      nil 
    else 
      raise response.body 
    end 
  end 
  
  def self.find_by_product_id(id) 
    # hhttp://www.supermarketapi.com/api.asmx/SearchByItemID?APIKEY=APIKEY&ItemId=32372
    response = Typhoeus::Request.get( "#{base_uri}/SearchByItemID?APIKEY=#{apikey}&ItemId=#{id}") 
    if response.code == 200 
      doc = Nokogiri::XML(response.body)
      array_of_products = ArrayOfProduct.parse(doc)
      
      # should be a 404 (not found) :(
      if array_of_products.product_sets && array_of_products.product_sets.first.item_name != 'NOITEM'
        array_of_products.product_sets
      else
        nil
      end
    elsif response.code == 404
      nil 
    else 
      raise response.body 
    end 
  end
  
  def self.find_all_us_states
    # http://www.SupermarketAPI.com/api.asmx/AllUSStates
    response = Typhoeus::Request.get( "#{base_uri}/AllUSStates") 
    if response.code == 200 
      doc = Nokogiri::XML(response.body)
      array_of_store_states = ArrayOfStoreState.parse(doc)
      array_of_store_states.store_state_sets 
    elsif response.code == 404
      nil 
    else 
      raise response.body 
    end 
  end
  
  def self.find_cities_by_state(state)
    #http://www.supermarketapi.com/api.asmx/CitiesByState?APIKEY=APIKEY&SelectedState=CA
    response = Typhoeus::Request.get( "#{base_uri}/CitiesByState?APIKEY=#{apikey}&SelectedState=#{state}") 
    if response.code == 200 
      doc = Nokogiri::XML(response.body)
      array_of_store_city = ArrayOfStoreCity.parse(doc)
      array_of_store_city.store_city_sets 
    elsif response.code == 404
      nil 
    else 
      raise response.body 
    end  
    
  end
  
  def self.find_product_names_by_full_name(full_name)
    #http://www.supermarketapi.com/api.asmx/GetGroceries?APIKEY=APIKEY&SearchText=Apple
    response = Typhoeus::Request.get( "#{base_uri}/GetGroceries?APIKEY=#{apikey}&SearchText=#{full_name}") 
    if response.code == 200 
      doc = Nokogiri::XML(response.body)
      array_of_string = ArrayOfString.parse(doc)
      array_of_string.string_sets 
    elsif response.code == 404
      nil 
    else 
      raise response.body 
    end 
  end
  
  def self.find_stores_by_name(store)
    #http://www.supermarketapi.com/api.asmx/ReturnStoresByName?APIKEY=APIKEY&StoreName=Safeway
    response = Typhoeus::Request.get( "#{base_uri}/ReturnStoresByName?APIKEY=#{apikey}&StoreName=#{store}") 
    if response.code == 200 
      doc = Nokogiri::XML(response.body)
      array_of_store = ArrayOfStore.parse(doc)
      array_of_store.store_sets 
    elsif response.code == 404
      nil 
    else 
      raise response.body 
    end 
  end 
  
  def self.find_products_by_store_id(store_id, name)
    # http://www.supermarketapi.com/api.asmx/SearchForItem?APIKEY=APIKEY&StoreId=b97153fc14&ItemName=Apple
    response = Typhoeus::Request.get( "#{base_uri}/SearchForItem?APIKEY=#{apikey}&StoreId=#{store_id}&ItemName=#{name}") 
    if response.code == 200 
       doc = Nokogiri::XML(response.body)
       array_of_products = ArrayOfProduct.parse(doc)
       # should be a 404 (not found) :(
       if array_of_products.product_sets && array_of_products.product_sets.first.item_name != 'NOITEM'
         array_of_products.product_sets
       else
         nil
       end
     elsif response.code == 404
       nil 
     else 
       raise response.body 
     end
  end 
  
  def self.find_stores_by_city_and_state(city,state)
    #http://http://www.SupermarketAPI.com/api.asmx/StoresByCityState?APIKEY=APIKEY&SelectedCity=San Francisco&SelectedState=CA
    city=CGI::escape(city)
    response = Typhoeus::Request.get( "#{base_uri}/StoresByCityState?APIKEY=#{apikey}&SelectedCity=#{city}&SelectedState=#{state}") 
    if response.code == 200 
      doc = Nokogiri::XML(response.body)
      array_of_store = ArrayOfStore.parse(doc)
      array_of_store.store_sets 
    elsif response.code == 404
      nil 
    else 
      raise response.body 
    end 
  end
  
  def self.find_stores_by_zip(zip)
    #http://www.SupermarketAPI.com/api.asmx/StoresByZip?APIKEY=APIKEY&ZipCode=95130
    response = Typhoeus::Request.get( "#{base_uri}/StoresByZip?APIKEY=#{apikey}&ZipCode=#{zip}") 
    if response.code == 200 
      doc = Nokogiri::XML(response.body)
      array_of_store = ArrayOfStore.parse(doc)
      array_of_store.store_sets 
    elsif response.code == 404
      nil 
    else 
      raise response.body 
    end 
  end
end


