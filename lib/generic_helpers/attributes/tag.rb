require 'active_support'
require 'active_support/concern'
require 'active_support/core_ext'

module GenericHelpers
  module Attributes
    # A Concern for the Tag attribute.
    #
    # It allows setting the default tag for a component.
    #
    # class Button
    #   include GenericHelpers::Attributes::Tag
    #
    #   default_tag :div
    # end
    module Tag
      extend ActiveSupport::Concern
      include Attributes::Base

      included do
        option :tag
      end

      def tag
        options[:tag] || self.class.tag
      end

      def tag=(value)
        options[:tag] = value
      end

      # Classmethods for Size module
      #
      # class Banner < GenericHelpers::Base
      #   default_tag :section
      # end
      #
      # Banner.tag => :section
      module ClassMethods
        def tag
          ancestors.each do |klass|
            if klass.instance_variable_defined?(:@tag)
              return klass.instance_variable_get(:@tag)
            end
          end
          :div
        end

        def default_tag(tag)
          @tag = tag
        end
      end
    end
  end
end
