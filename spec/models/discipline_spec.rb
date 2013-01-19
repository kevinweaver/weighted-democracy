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

  it "has many questions" do
    should have_many(:questions)
  end

  it "has a many to many relationship with issues" do
    #should have_many(:issue_disciplines)
    #should have_many(:issues).through(:issue_disciplines)
    should have_and_belong_to_many(:issues)
  end
  
end
