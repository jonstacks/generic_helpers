require 'generic_helpers/attributes/size'

module GenericHelpers
  class Base
    include Attributes::Size
    include Attributes::Layout
  end
end
