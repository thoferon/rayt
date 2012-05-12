require "rayt/chained_methods_arguments"

module Rayt
  class ChainedMethodsDefinition
    attr_reader :chained_methods_arguments

    def initialize(parent = nil)
      @parent = parent || Rayt

      @chained_methods_arguments = parent ?
        parent.chained_methods_arguments :
        Rayt::ChainedMethodsArguments.new
    end

    ##
    # All the magic is here.

    def method_missing(method_name, *arg_names, &block)
      (class << @chained_methods_arguments; self; end).instance_eval do
        arg_names.each do |arg_name|
          attr_accessor arg_name
        end
      end

      (class << @parent; self; end).instance_exec(@chained_methods_arguments, self) do |args, definition|
        define_method method_name do |*passed_arguments|
          passed_arguments.each_with_index do |pa, i|
            args.instance_variable_set(("@" + arg_names[i].to_s), pa)
          end

          if block
            block.call args
          else
            definition
          end
        end
      end

      Rayt::ChainedMethodsDefinition.new self
    end
  end
end
