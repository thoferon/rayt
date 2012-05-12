require "rayt/chained_methods_definition"

describe Rayt::ChainedMethodsDefinition do
  describe "#method_missing" do
    it "should return a new instance of Rayt::ChainedMethodsDefinition" do
      subject.anything.should be_a(Rayt::ChainedMethodsDefinition)
    end
  end
end
