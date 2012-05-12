require "rays/chained_methods_definition"

describe Rays::ChainedMethodsDefinition do
  describe "#method_missing" do
    it "should return a new instance of Rays::ChainedMethodsDefinition" do
      subject.anything.should be_a(Rays::ChainedMethodsDefinition)
    end
  end
end
