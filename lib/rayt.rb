require "rayt/constants"
require "rayt/chained_methods_definition"

module Rayt
  class << self
    def define
      Rayt::ChainedMethodsDefinition.new
    end
  end
end
