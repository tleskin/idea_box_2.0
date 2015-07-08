require 'rails_helper'

RSpec.describe Idea, type: :model do
  let(:idea) { Idea.create!(title: "Get A Job", body: "Pass Final at Turing")}
  it "is valid" do
    expect(idea).to be_valid
  end

  it "it is invalid without a title" do
    idea.title = nil

    expect(idea).to_not be_valid
  end

  it "it is invalid without a body" do
    idea.body = nil

    expect(idea).to_not be_valid
  end

  it "it is invalid without a unique title" do
    Idea.create!(title: "Get A Job", body: "Make Some Money")
    expect(Idea.count).to eq(1)
  end

end
