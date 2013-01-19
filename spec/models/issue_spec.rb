require 'spec_helper'

describe Issue do
  it "has a valid factory" do
    expect(create :issue).to be_valid
  end

  it "is invalid without a name" do
    expect(build :issue, name: nil).to_not be_valid
  end

  it "is invalid without a description" do
    expect(build :issue, description: nil).to_not be_valid
  end

  it "has many to many relationship with disciplines" do
    #should have_many(:issue_disciplines)
    #should have_many(:disciplines).through(:issue_disciplines)
    should have_and_belong_to_many :disciplines
  end
end
