# require_relative 'middleware/runtime'
require_relative 'services/time'
require_relative 'app'


# use Runtime
run App.new
