require 'active_support'
require 'active_support/concern'
require 'active_support/core_ext'

module GenericHelpers
  module Attributes
    # A Concern for the Layout attribute.
    #
    # It allows setting the layout options for a component and their
    # corresponding css class.
    #
    # class Button
    #   include GenericHelpers::Attributes::Layout
    #
    #   layout :block, 'btn-block'
    # end
    module Layout
      extend ActiveSupport::Concern
      include Attributes::Base

      included do
        option :layout
      end

      def layout_class
        self.class.layouts[@options[:layout]]
      end

      # Classmethods for Layout module
      #
      # class Button < GenericHelpers::Base
      #   layout :block, 'btn-block'
      # end
      #
      # Button.layouts => { 'block': 'btn-block' }
      module ClassMethods
        def layout(layout, klass = nil)
          layouts.default = klass if [nil, :default].include?(layout)
          layouts[layout] = klass
        end

        def layouts
          @layouts ||= HashWithIndifferentAccess.new
        end
      end
    end
  end
end
