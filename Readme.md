# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# The Assignment is basically divided into apps, MVC app and the API
# all the database will be residing in the API and front end will in the MVC app(forms, views etc)


# Sample POST request for creating a new product
#URL: http://localhost:4001/api/v1/products
method: POST
request body:
 {
  "utf8": "✓",
  "authenticity_token": "WW+Fbtc55QwnP9AfwhGYWrlCXTz3gKQJAJTDMQn/BLM3MfAR/O67s6asc0ApWAC0q5tCp4Zq0ONDY2Ndvh/Wig==",
  "product": {
    "name": "T-shirt",
    "expiry_date": "2018-08-29",
    "price": "1999",
    "sku_id": "2334",
    "image_path": "https://www.gstatic.com/webp/gallery3/1.png, https://www.gstatic.com/webp/gallery3/1.png"
  },
  "category": {
    "name": [
      "black",
      "red"
    ]
  },
  "tags": {
    "name": [
      "round-neck",
      "stripes"
    ]
  },
  "commit": "Save Product"
}

 # Sample POST request for updating a existing product
#URL: http://localhost:4001/api/v1/products
method: POST
request body:
 {
  "utf8": "✓",
  "authenticity_token": "VezET4EnIaaM1Vm00GxHuotyKsl08qslQYzzaYMquJCirV1jedUzeEXqpnIKk9GtMZSJrJhvWhhwDP3NjsHHLg==",
  "product": {
    "name": "T-shirt",
    "expiry_date": "2018-08-29",
    "price": "1999",
    "sku_id": "2334"
  },
  "category": {
    "name": [
      "black",
      "red"
    ]
  },
  "tags": {
    "name": [
      "round-neck",
      "stripes",
      "lines"
    ]
  },
  "commit": "Save Product",
  "id": "30"
}