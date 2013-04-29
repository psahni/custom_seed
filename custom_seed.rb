
require 'rails'
require 'lib/custom_seed/custom_seed'
require 'lib/custom_seed/custom_seed_migration'


module CustomSeed

  require 'lib/custom_seed/railtie' if defined?(Rails)

end

