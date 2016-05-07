require 'active_support'
require 'active_support/concern'
require 'active_support/core_ext'

module GenericHelpers
  module Attributes
    # A Concern for the Size attribute.
    #
    # It allows setting the size options for a component and their
    # corresponding css class.
    #
    # class Button
    #   include GenericHelpers::Attributes::Base
    #
    #   size 'btn-size-default'
    #   size :small, 'btn-small'
    #   size :large, 'btn-large'
    # end
    module Size
      extend ActiveSupport::Concern
      include Attributes::Base

      included do
        option :size
      end

      def size_class
        self.class.sizes[@options[:size]]
      end

      # Classmethods for Size module
      #
      # class Button < GenericHelpers::Base
      #   size :small, 'btn-small'
      #   size :large, 'btn-large'
      # end
      #
      # Button.sizes => { 'small': 'btn-small', 'large': 'btn-large' }
      module ClassMethods
        def size(size, klass = nil)
          sizes.default = klass if [nil, :default].include?(size)
          sizes[size] = klass
        end

        def sizes
          @sizes ||= HashWithIndifferentAccess.new
        end
      end
    end
  end
end
