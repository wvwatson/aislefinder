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
products.first.item_name # should match /Mccormick Parsley Flake Gourmet/ 
```
 
*Find product by Id*

```
products = AisleFinder.find_by_product_id("32372")
products.first.item_name #should match /Mccormick Parsley Flake Gourmet/
```

*Find products by full name*
```
AisleFinder.find_product_names_by_full_name("Apple").first.product_name #should match /Apples/
```

*Find stores by name*
```
 AisleFinder.find_stores_by_name("Safeway").first.store_name #should match /Safeway/
```

*Find products by store id*
```
AisleFinder.find_products_by_store_id("b97153fc14", "Apple").first.item_name #should match /Apples/
```

*Find stores by city and state*
```
AisleFinder.find_stores_by_city_and_state("San Francisco", "CA").first.store_name #should match /Safeway/
```

*Find stores by zip*
```
AisleFinder.find_stores_by_zip("95130").first.store_name #should match /Luckys/
```

*Find all of the U.S. states*
```
AisleFinder.find_all_us_states.first.state #should match /AL/
```

*Find cities by state*
```
AisleFinder.find_cities_by_state("CA").first.city #should match /Anderson/
```


