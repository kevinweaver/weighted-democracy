require 'spec_helper'

describe Question do
  it "has a valid factory" do
    expect(create :question).to be_valid
  end
 
  it "is invalid without a name" do
    expect(build :question,name: nil).to_not be_valid
  end
 
  it "is invalid without text" do
    expect(build :question,text: nil).to_not be_valid
  end

  it { should belong_to(:discipline) }

end
