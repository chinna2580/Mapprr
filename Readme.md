# README

Rails version for API : 5.2.0 for ActiveStorage, SQLlite as database
Run the APP on any port and APi on 4001 port
if you want to run the API on different port, please go to application.rb file of MprProductAPP and change the port number accordingly
# 

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version (2.2.5)

* System dependencies(active_supprt)

* Configuration

* Database creation(run rails db:create, rails db:migrate)

* Database initialization

* How to run the test suite(No, test cases written)

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* The Assignment is basically divided into apps, MVC app and the API

* all the database will be residing in the API and front end will in the MVC app(forms, views etc)



* Sample POST request for creating a new product
URL: http://localhost:4001/api/v1/products
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

* Sample POST request for updating a existing product
* URL: http://localhost:4001/api/v1/products
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