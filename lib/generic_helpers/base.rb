require 'generic_helpers/attributes/size'

module GenericHelpers
  class Base
    include Attributes::Align
    include Attributes::Context
    include Attributes::Layout
    include Attributes::Size
    include Attributes::Tag
  end
end
