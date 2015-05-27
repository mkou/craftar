# CraftAR Ruby Gem

## Description

The CraftAR Service for [Augmented Reality and Image Recognition](http://catchoom.com/product/craftar/augmented-reality-and-image-recognition/) is a  service
that allows you to build a wide range of __Image Recognition__ and __Augmented Reality__ applications
and services.

This client library provides access to CraftAR API:

- [CraftAR Management API]
(http://catchoom.com/documentation/api/management/)
  allows upload and management of _collections_ of _reference images_, and associated meta-data such as _Augmented Reality experiences_ and their content.
  All requests must be authenticated using your _Management API key_.



## Installation

    gem install catchoom

Or if you are using rails 

    gem 'catchoom', require: false


## Quick Start

Follow these steps to create a _collection_ with one _item_ and perform
an image recognition request against that collection.  A _collection_ is a set
of _items_ representing entities that you want to recognize. Examples of _items_ 
are logos, physical objects, or a drawings, among others.
You can do it directly from your python interpreter.

Get [your management api_key](https://my.craftar.net/api_access/).
This is needed to authenticate your requests to the Management API.
    
    require catchoom
    
    # use your own api_key!
    Catchoom.api_key = ENV['catchoom_api_key']

    
### Collections

###### Create a new collection.
    
    name = "My cool colection" # use your own collection name
    collection = Catchoom::Collection.create(name: name)

###### Update a collection
    name = 'My newly named cool collection'
    collection.update(name: name)


###### Delete a collection
    collection.destroy

###### Get a collection
    uuid = '' #The uuid of the collection you want to find
    Catchoom::Collection.find(uid)

###### Get the collection list
    Catchoom::Collection.list
    Catchoom::Collection.list name: 'name', limit: 10
    Catchoom::Collection.list name__contains: 'nam', offset: 10, limit: 20
    

  

### Items

###### Create a new item.
    
    name = 'test' # use your own item name
    item = Catchoom::Item.create(collection: collection.resorce_uri, name: name, trackable: false)

###### Update an item

    item.update(trackable: true)

Possible parameters: name, collection, url, content, custom, trackable

###### Delete an item
    item.destroy

###### Get an item
    uuid = '8a95c8ab98e9c464' #The uuid of the item you want to find
    Catchoom::Item.find(uid)

###### Get the item list
    Catchoom::Item.list
    Catchoom::Item.list name: 'name', limit: 10
    Catchoom::Item.list name_contains: 'nam', offset: 10, limit: 20

  You can also filter by 
  - collection__uuid
  - collection__name
  - collection__name__contains


