require 'dirge'
require ~'spec_helper'

class Testing
  include DslHelper
  
  dsl_attr :test
  
end

describe "DslHelper" do
  it "should provide useful helper methods" do
    t = Testing.new
    t.respond_to?(:_test).should be_true
    t.respond_to?(:_test=).should be_true
    t.respond_to?(:test).should be_true
  end

  it "should store the value in the instance var of its name" do
    t = Testing.new
    t.test 'something'
    t._test.should == 'something'
  end

  it "should assign normally though the underscore writer" do
    t = Testing.new
    t._test = 'something'
    t._test.should == 'something'
  end

end