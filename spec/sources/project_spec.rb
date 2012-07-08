require File.join(File.dirname(__FILE__),'..','spec_helper')

describe "Project" do
  it_should_behave_like "SpecHelper" do
    before(:each) do
      setup_test_for Project,'testuser'
    end

    it "should process Project query" do
      pending
    end

    it "should process Project create" do
      pending
    end

    it "should process Project update" do
      pending
    end

    it "should process Project delete" do
      pending
    end
  end  
end