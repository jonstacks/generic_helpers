require 'active_support'
require 'active_support/concern'
require 'active_support/core_ext'

module GenericHelpers
  module Attributes
    # A Concern for the Context attribute.
    #
    # It allows setting the context options for a component and their
    # corresponding css class.
    #
    # class Button
    #   include GenericHelpers::Attributes::Context
    #
    #   context 'btn-default'
    #   context :primary, 'btn-primary'
    #   context :success, 'btn-success'
    #   context :info,    'btn-info'
    #   context :warning, 'btn-warning'
    #   context :danger,  'btn-danger'
    #   context :link,    'btn-link'
    # end
    module Context
      extend ActiveSupport::Concern
      include Attributes::Base

      included do
        option :context
      end

      def context_class
        self.class.context_class(options[:context])
      end

      module ClassMethods
        def context(context, klass = nil)
          contexts.default = context if klass.nil? || context == :default
          contexts[context] = klass unless klass.nil?
        end

        def contexts
          @contexts ||= HashWithIndifferentAccess.new
        end

        def context_class(context)
          ancestors.each do |klass|
            if klass.instance_variable_defined?(:@contexts)
              contexts = klass.instance_variable_get(:@contexts)
              return contexts[context] if contexts.key?(context)
            end
          end
          nil
        end
      end
    end
  end
end
