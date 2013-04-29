
require 'rails'

require 'custom_seed/seed'
require 'custom_seed/custom_seed_migration'
require 'custom_seed/version'

module CustomSeed

  require 'lib/custom_seed/railtie' if defined?(Rails)

end

