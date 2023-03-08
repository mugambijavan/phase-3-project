require 'rails_helper'

RSpec.describe User, type: :model do 
  it "returns user's full name" do
    user = User.create(name: "Foosta")

    expect(user.name).to eq "Foosta"
  end

  it "must have email" do
    user = User.new(name: 'Foosta').save
    expect(user).to eq(false)
  end

  it "should save user successfully" do
    user = User.new(name: "Foosta Bubba", email: 'foostabubba@example.com', password: "foobar").save
    expect(user).to eq(true)
  end
end
