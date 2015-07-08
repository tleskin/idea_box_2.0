class IdeasController < ApplicationController
  respond_to :json

  def index
    @ideas = Idea.all
  end

  def create
    @idea = Idea.create(title: params["title"], body: params["body"])
    @idea.save
    respond_with @idea, status: 201, location: ideas_path
  end

  def destroy
    @idea = Idea.find(params["id"])
    @idea.destroy
    respond_with "", status: 201, location: ideas_path
  end
end
