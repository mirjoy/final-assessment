require 'rails_helper'

RSpec.describe Language, type: :model do
  it "must have a name" do
    lang1 = Language.create(name: "catlang")
    lang2 = Language.create(name: "")

    expect(lang1.id).to be_truthy
    expect(lang2.id).to be_falsy
  end
end
