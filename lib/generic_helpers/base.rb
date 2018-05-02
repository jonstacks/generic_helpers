# frozen_string_literal: true

require 'generic_helpers/attributes/size'

module GenericHelpers
  class Base
    include Attributes::Align
    include Attributes::Context
    include Attributes::Size
    include Attributes::Layout
  end
end
