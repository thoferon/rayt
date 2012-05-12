require "rays"

describe Rays do
  context "general use of chained methods" do
    it "should works as in the example 'basics'" do
      Rays.define.the(:animal).is(:colour) do |args|
        puts "The #{args.animal} is #{args.colour}"
      end
    end
  end

  describe ".define" do
    it "should return a Rays::ChainedMethodsDefinition instance" do
      Rays.define.should be_a(Rays::ChainedMethodsDefinition)
    end

    it "should add a method to the Rays context if called on it" do
      Rays.define.a_method { }
      expect {
        Rays.a_method
      }.not_to raise_error
    end

    it "should define methods for arguments" do
      Rays.define.a_method(:first, :second) do |args|
        args.first + args.second
      end
      Rays.a_method(2, 3).should == 5
    end
  end
end
