require 'spec_helper'
#This file is called issue_disciplineS*

describe IssueDiscipline do

  it "belongs to discipline" do
    should belong_to(:discipline)
  end

  it "belongs to issue" do
    should belong_to(:issue)
  end
end
