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

    it "B003: setItem multiples", ->
      for i in [1..100]
        @memory_storage.setItem "key_#{i}", "value_#{i}"
      @memory_storage.length.should.equal 100


