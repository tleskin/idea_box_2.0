require 'rails_helper'
require 'json'

RSpec.describe IdeasController, type: :controller do
  before(:each) do
    Idea.create!(title: "Great Idea", body: "Great Body")
  end

  describe "edit" do
    it("returns json") do
      id = Idea.last.id
      idea_params = { title: "New Idea", body: "New Body"}
      put :update, format: :json, id: id, idea: idea_params
      data = Idea.find(id)
      expect(data[:title]).to eq("New Idea")
      expect(data[:body]).to eq("New Body")
    end
  end

end
