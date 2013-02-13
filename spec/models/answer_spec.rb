require 'spec_helper'

describe Answer do
  it { should belong_to(:question) }
  it "has a valid factory" do
    expect(create :answer).to be_valid
  end

  it "is invalid without text" do
    expect(build :answer, text: nil).to_not be_valid
  end
end
