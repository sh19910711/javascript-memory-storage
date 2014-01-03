describe "T001: MemoryStorage", ->
  # Load Module
  before (done)->
    requirejs(
      [
        "memory_storage"
      ]
      (
        MemoryStorage
      )=>
        @MemoryStorage = MemoryStorage
        done()
    )

  # Create Instance for each test
  beforeEach ->
    @memory_storage = new @MemoryStorage

  context "A001: length", ->
    it "B001: none", ->
      @memory_storage.length.should.equal 0

    it "B002: setItem once", ->
      @memory_storage.setItem "key", "value"
      @memory_storage.length.should.equal 1

    it "B003: setItem multi", ->
      for i in [1..100]
        @memory_storage.setItem "key_#{i}", "value_#{i}"
      @memory_storage.length.should.equal 100

    it "B004: removeItem", ->
      for i in [1..100]
        @memory_storage.setItem "key_#{i}", "value_#{i}"
      remove_keys = [5, 27, 68, 91]
      for i in remove_keys
        @memory_storage.removeItem "key_#{i}"
      @memory_storage.length.should.equal 100 - remove_keys.length

    it "B005: clear", ->
      for i in [1..100]
        @memory_storage.setItem "key_#{i}", "value_#{i}"
      @memory_storage.clear()
      @memory_storage.length.should.equal 0

  context "A002: key", ->
    it "B001: none", ->
      (@memory_storage.key(0) == null).should.be.true
      (@memory_storage.getItem("none") == null).should.be.true

    it "B002: setItem once", ->
      @memory_storage.setItem "key", "value"
      @memory_storage.key(0).should.equal "key"

    it "B003: setItem multi", ->
      for i in [1..100]
        @memory_storage.setItem "key_#{i}", "value_#{i}"
      @memory_storage.key(0).should.equal "key_1"
      @memory_storage.key(45).should.equal "key_46"
      @memory_storage.key(99).should.equal "key_100"

    it "B004: removeItem", ->
      for i in [1..100]
        @memory_storage.setItem "key_#{i}", "value_#{i}"
      @memory_storage.removeItem("key_45")
      @memory_storage.key(0).should.equal "key_1"
      @memory_storage.key(44).should.equal "key_46"
      @memory_storage.key(98).should.equal "key_100"

    it "B005: clear", ->
      for i in [1..100]
        @memory_storage.setItem "key_#{i}", "value_#{i}"
      @memory_storage.clear()
      (@memory_storage.key(0) == null).should.be.true
      (@memory_storage.key(44) == null).should.be.true
      (@memory_storage.key(98) == null).should.be.true


