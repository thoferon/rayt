require "rayt"

describe Rayt do
  context "general use of chained methods" do
    it "should works as in the example 'basics'" do
      obj = Object.new
      obj.should_receive(:callback).with(/The cat is blue/)
      Rayt.define.the(:animal).is(:colour) do |args|
        obj.callback "The #{args.animal} is #{args.colour}"
      end
      Rayt.the("cat").is("blue")
    end
  end

  describe ".define" do
    it "should return a Rayt::ChainedMethodsDefinition instance" do
      Rayt.define.should be_a(Rayt::ChainedMethodsDefinition)
    end

    it "should add a method to the Rayt context if called on it" do
      Rayt.define.a_method { }
      expect {
        Rayt.a_method
      }.not_to raise_error
    end

    it "should define methods for arguments" do
      Rayt.define.a_method(:first, :second) do |args|
        args.first + args.second
      end
      Rayt.a_method(2, 3).should == 5
    end
  end
end
