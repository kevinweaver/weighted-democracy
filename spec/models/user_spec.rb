require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(create :user).to be_valid
  end
  
  it "is invalid without first_name" do
    expect(build :user, first_name: nil).to_not be_valid
  end

  it "is invalid without last_name" do
    expect(build :user,last_name: nil).to_not be_valid
  end
  
  it "is invalid without email" do
    expect(build :user,email: nil).to_not be_valid
  end

  it "is invalid if email already exists" do
    create :user, email: "email@email.com"
    expect(build :user, email: "email@email.com").to_not be_valid
  end

  it "authenticates" do
    user = create :user
    expect(user.authenticate("no_pass")).to be_false
    expect(user.authenticate("secret")).to be_true
  end
end
