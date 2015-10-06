# CraftAR Ruby Gem

## Description

The Catchoom's CraftAR Service for [Augmented Reality and Image Recognition](http://craftar.com/product/craftar/augmented-reality-and-image-recognition/) is a  service
that allows you to build a wide range of __Image Recognition__ and __Augmented Reality__ applications
and services.

This client library provides access to CraftAR API:

- [CraftAR Management API]
(http://craftar.com/documentation/api/management/)
  allows upload and management of _collections_ of _reference images_, and associated meta-data such as _Augmented Reality experiences_ and their content.
  All requests must be authenticated using your _Management API key_.



## Installation

    gem install craftar

Or if you are using rails

    gem 'craftar', require: false


## Quick Start

Follow these steps to create a _collection_ with one _item_ and perform
an image recognition request against that collection.  A _collection_ is a set
of _items_ representing entities that you want to recognize. Examples of _items_
are logos, physical objects, or a drawings, among others.
You can do it directly from your python interpreter.

Get [your management api_key](https://my.craftar.net/api_access/).
This is needed to authenticate your requests to the Management API.

    require craftar

    # use your own api_key!
    Craftar.api_key = ENV['craftar_api_key']


### Collections

###### Create a new collection.

    name = "My cool colection" # use your own collection name
    collection = Craftar::Collection.create(name: name)

###### Update a collection
    name = 'My newly named cool collection'
    collection.update(name: name)


###### Delete a collection
    collection.destroy

###### Get a collection
    uuid = '' #The uuid of the collection you want to find
    Craftar::Collection.find(uuid)

###### Get the collection list
    Craftar::Collection.list
    Craftar::Collection.list name: 'name', limit: 10
    Craftar::Collection.list name__contains: 'nam', offset: 10, limit: 20


### Items

###### Create a new item.

    name = 'test' # use your own item name
    item = Craftar::Item.create(collection: collection.resorce_uri, name: name, trackable: false)

###### Update an item

    item.update(trackable: true)

Possible parameters: name, collection, url, content, custom, trackable

###### Delete an item
    item.destroy

###### Get an item
    uuid = '8a95c8ab98e9c464' #The uuid of the item you want to find
    Craftar::Item.find(uuid)

###### Get the item list
    Craftar::Item.list
    Craftar::Item.list name: 'name', limit: 10
    Craftar::Item.list name_contains: 'nam', offset: 10, limit: 20

  You can also filter by
  - collection__uuid
  - collection__name
  - collection__name__contains



### Images

###### Create a new image.

    file = 'http://blabla/image.jpg'
    image = Craftar::Image.create(item: item.resorce_uri, file: file)

Possible parameters: name, collection, url, content, custom, trackable

###### Delete an image
    image.destroy

###### Get an image
    uuid = '8a95c8ab98e9c464' #The uuid of the image you want to find
    Craftar::Image.find(uuid)
You will receive uuid, item, file, resource_uri, name, status, thumb_120, thumb_60, tracking_data_status

###### Get the image list
    Craftar::Image.list
    Craftar::Image.list name: 'name', limit: 10
    Craftar::Image.list name_contains: 'nam', offset: 10, limit: 20

  You can also filter by
  - item__uuid: filter by item UUID.
  - item__name: filter by item by this exact match.
  - item__name__contains: filter by item by case-sensitive containment.
  - item__collection__uuid: filter by item’s collection UUID.
  - item__collection__name: filter by item’s collection name, using this exact match.
  - item__collection__name__contains: filter by item’s collection name, using case-sensitive containment.
  - status: filter by image status (ER or OK).

### Token

###### Create a new token
    token = Craftar::Token.create(collection: collection.collection_uri)

###### Delete a token
    token.destroy

###### Get token list
    Craftar::Token.list
    Craftar::Token.list offset: 10, limit: 20
You can also filter by:
- collection__uuid: filter by collection UUID.
- collection__name: filter by collection name, using this exact match.
- collection__name__contains: filter by collection name, using case-sensitive containment.

### Media

###### Create a new media.

    file = 'http://test/test.jpg' # use your own media url
    media = Craftar::Media.create(name: name, file: file)

###### Get a media
    uuid = '8a95c8ab98e9c464' #The uuid of the media you want to find
    Craftar::Media.find(uuid)

###### Get the media list
    Craftar::Media.list
    Craftar::Media.list name: 'name', limit: 10
    Craftar::Media.list name_contains: 'nam', offset: 10, limit: 20

  You can also filter by
  - mimetype
  - mimetype__contains

### Application ID

###### Create a new app 

    media = Craftar::App.create(name: name, collection: collection.resource_uri)

###### Get an app
    uuid = '8a95c8ab98e9c464' #The uuid of the app you want to find
    Craftar::App.find(uuid)

###### Get the app list
    Craftar::App.list
    Craftar::App.list name: 'name', limit: 10
    Craftar::App.list name_contains: 'nam', offset: 10, limit: 20

### SDK versions

###### Get a version
    uuid = '8a95c8ab98e9c464' #The uuid of the version you want to find
    Craftar::SdkVersion.find(uuid)

###### Get the app list
    Craftar::SdkVersion.list
    Craftar::SdkVersion.list, offset: 10, limit: 20

### Collection Bundle

###### Create a new collection bundle.

    collection_bundle = Craftar::CollectionBundle.create(collection: collection.resource_uri, app: app.resource_uri, version: version.resource_uri)


###### Delete an collection bundle
    collection_bundle.destroy

###### Get an collection bundle
    uuid = '8a95c8ab98e9c464' #The uuid of the collection bundle you want to find
    Craftar::Item.find(uuid)

###### Get the collection bundle list
    Craftar::CollectionBundle.list
    Craftar::CollectionBundle.list, offset: 10, limit: 20

## Contributing

Please, if you use it, report back any bugs/problems.
- Fork it
- Create your feature branch (git checkout -b my-new-feature)
- Commit your changes (git commit -am 'Add some feature')
- Don't forget to test your feature
- Push to the branch (git push origin my-new-feature)
- Create new Pull Request
