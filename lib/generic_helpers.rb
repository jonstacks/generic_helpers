require 'active_support'
require 'active_support/dependencies'

module GenericHelpers
  extend ActiveSupport::Autoload

  autoload :Base
  autoload :Version

  module Attributes
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :Size
  end
end
