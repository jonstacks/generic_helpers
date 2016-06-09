require 'active_support'
require 'active_support/concern'
require 'active_support/core_ext'

module GenericHelpers
  module Attributes
    # A Concern for the Align attribute.
    #
    # It allows setting the align options for a component and their
    # corresponding css class.
    #
    # class Dropdown
    #   include GenericHelpers::Attributes::Align
    #
    #   align :left,  'dropdown-menu-left'
    #   align :right, 'dropdown-menu-right'
    # end
    module Align
      extend ActiveSupport::Concern
      include Attributes::Base

      included do
        option :align
      end

      def align_class
        self.class.aligns[@options[:align]]
      end

      # Classmethods for Align module
      #
      # class Dropdown < GenericHelpers::Base
      #   align :left,  'dropdown-menu-left'
      #   align :right, 'dropdown-menu-right'
      # end
      #
      # Dropdowns.aligns => {
      #   'left': 'dropdown-menu-left',
      #   'right': 'dropdown-menu-right'
      # }
      module ClassMethods
        def align(align, klass = nil)
          aligns.default = klass if [nil, :default].include?(align)
          aligns[align] = klass
        end

        def aligns
          @aligns ||= HashWithIndifferentAccess.new
        end
      end
    end
  end
end
