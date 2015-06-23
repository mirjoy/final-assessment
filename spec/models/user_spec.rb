require 'rails_helper'

RSpec.describe User, type: :model do
  it "must have a name" do
    person = User.create(uid: "123")

    expect(person.id).to be_nil
  end

  it "must have a uid" do
    person = User.create(name: "richard")

    expect(person.id).to be_nil
  end

  it "must have a unique uid" do
    person = User.create(name: "richard", uid: "123")
    person2 = User.create(name: "richard", uid: "123")

    expect(person2.id).to be_nil
  end
end
