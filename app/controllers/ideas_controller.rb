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

  def edit
    @idea = Idea.find(params["id"])
  end

  def destroy
    @idea = Idea.find(params["id"])
    @idea.destroy
    respond_with "", status: 201, location: ideas_path
  end

  def update
    @idea = Idea.find(params["id"])
    if @idea.update(idea_params)
      flash[:success] = "Your idea has been updated!"
      redirect_to ideas_path
    else
      flash[:error] = @idea.errors.full_messages.join(", ")
      redirect_to ideas_path
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body)
  end
end
