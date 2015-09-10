$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'benchmark'

require 'enginevib/launcher'
require 'enginevib/io'
require 'enginevib/main'
require 'enginevib/sensor'
require 'enginevib/output'
require 'enginevib/system'
require 'enginevib/soft_ticker'
require 'enginevib/scheduler'
require 'enginevib/controller'
require 'enginevib/stats'
require 'enginevib/averager'
require 'enginevib/version'


require 'rtos'

require 'minitest/autorun'

$VERBOSE = true
$SOFT_TICKER = false
$TEST = true
