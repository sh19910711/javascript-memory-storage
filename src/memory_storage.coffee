#
# MemoryStorage
# Copyright (c) 2014 Hiroyuki Sano
#
define(
  [
  ]
  (
  )->
    class MemoryStorage
      constructor: ->
        @clear()

      # get key with index
      key: (index)->
        return null if @length == 0
        if index < 0 && index >= @length then null else @keys[index]

      # get item
      getItem: (key)->
        @_get key

      # set item
      setItem: (key, data)->
        @storage[key] = data
        @keys.push key
        @length += 1
        undefined

      # remove item
      removeItem: (removed_key)->
        delete @storage[removed_key]
        @keys = @keys.filter (key)->
          key != removed_key
        @length -= 1
        undefined

      clear: ->
        @keys = []
        @storage = {}
        @length = 0
        undefined

      _get: (key)->
        item = @storage[key]
        if typeof item == "undefined" then null else item
)
