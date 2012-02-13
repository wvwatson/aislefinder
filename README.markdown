Aisle finder
===============================

**Installation**

``` 
gem install aislefinder
```

*Usage*

Set the get an api key from www.supermarketapi.com.
Set the base uri and apikey

```
require 'aislefinder'
AisleFinder.base_uri = 'http://www.SupermarketAPI.com/api.asmx'
AisleFinder.apikey = 'YOURAPIKEYHERE'
```

*Find by product name*

``` 
products = AisleFinder.find_by_product_name("Parsley") 
-- should match /Mccormick Parsley Flake Gourmet/
products.first.item_name  
```
 
*Find product by Id*

```
products = AisleFinder.find_by_product_id("32372")
--should match /Mccormick Parsley Flake Gourmet/
products.first.item_name 
```

*Find products by full name*
```
AisleFinder.find_product_names_by_full_name("Apple").first.product_name
should match /Apples/ 
```

*Find stores by name*
```
--should match /Safeway/  
AisleFinder.find_stores_by_name("Safeway").first.store_name 
```

*Find products by store id*
```
--should match /Apples/  
AisleFinder.find_products_by_store_id("b97153fc14", "Apple").first.item_name
```

*Find stores by city and state*
```
--should match /Safeway/  
AisleFinder.find_stores_by_city_and_state("San Francisco", "CA").first.store_name 
```

*Find stores by zip*
```
--should match /Luckys/  
AisleFinder.find_stores_by_zip("95130").first.store_name 
```

*Find all of the U.S. states*
```
--should match /AL/  
AisleFinder.find_all_us_states.first.state 
```

*Find cities by state*
```
--should match /Anderson/  
AisleFinder.find_cities_by_state("CA").first.city 
```


