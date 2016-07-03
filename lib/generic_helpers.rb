require 'active_support'
require 'active_support/dependencies'

module GenericHelpers
  extend ActiveSupport::Autoload

  autoload :Base
  autoload :Version

  module Attributes
    extend ActiveSupport::Autoload

    autoload :Align
    autoload :Base
    autoload :Context
    autoload :Layout
    autoload :Size
  end
end
