require 'spec_helper'

describe Discipline do
  it "has a valid factory" do
    expect(create :discipline).to be_valid
  end
 
  it "is invalid without a name" do
    expect(build :discipline,name: nil).to_not be_valid
  end
 
  it "is invalid without a description" do
    expect(build :discipline,description: nil).to_not be_valid
  end



end
