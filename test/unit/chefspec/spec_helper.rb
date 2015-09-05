require 'chefspec'
require 'chefspec/berkshelf'
require 'chefspec/cacher'
require 'chef/sugar'

RSpec.configure do |c|
  c.platform  = 'ubuntu'
  c.version   = '14.04'
  c.log_level = :error
end

ChefSpec::Coverage.start!
