require "rays/constants"
require "rays/chained_methods_definition"

module Rays
  class << self
    def define
      Rays::ChainedMethodsDefinition.new
    end
  end
end
