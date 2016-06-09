require 'generic_helpers/attributes/size'

module GenericHelpers
  class Base
    include Attributes::Align
    include Attributes::Size
    include Attributes::Layout
  end
end
