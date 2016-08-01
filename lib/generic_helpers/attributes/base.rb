require 'active_support'
require 'active_support/concern'
require 'active_support/core_ext'

module GenericHelpers
  module Attributes
    # The base attribute that other attributes rely on. It allows for setting
    # an option on the class.
    module Base
      extend ActiveSupport::Concern

      private

      def options
        @options ||= {}
      end

      module ClassMethods
        def option(key)
          @options ||= []
          @options.push(key)
          @options.compact!
          @options.uniq!
        end

        def options
          @options.clone.tap(&:freeze)
        end
      end
    end
  end
end
