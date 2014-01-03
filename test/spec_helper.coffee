_ = require "underscore"
path = require "path"

# load modules
_(global).extend
  requirejs: require "requirejs"
  should: require "should"

src_dir = path.resolve __dirname, "../src"
lib_dir = path.resolve __dirname, "../tmp/lib"

# requirejs config
requirejs.config
  paths:
    "memory_storage": "#{lib_dir}/memory_storage"
