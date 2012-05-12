require "rays/chained_methods_arguments"

module Rays
  class ChainedMethodsDefinition
    attr_reader :chained_methods_arguments

    def initialize(parent = nil)
      @parent = parent || Rays

      @chained_methods_arguments = parent ?
        parent.chained_methods_arguments :
        Rays::ChainedMethodsArguments.new
    end

    ##
    # All the magic is here.

    def method_missing(method_name, *arg_names, &block)
      (class << @chained_methods_arguments; self; end).instance_eval do
        arg_names.each do |arg_name|
          attr_accessor arg_name
        end
      end

      (class << @parent; self; end).instance_exec(@chained_methods_arguments) do |args|
        define_method method_name do |*passed_arguments|
          passed_arguments.each_with_index do |pa, i|
            args.instance_variable_set(("@" + arg_names[i].to_s), pa)
          end

          block.call args if block
        end
      end

      Rays::ChainedMethodsDefinition.new self
    end
  end
end
