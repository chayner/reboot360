class TrainingController < ApplicationController

  def index
    redirect_to training_path(:build)
  end

  def show
    @training = Training.find_by_slug(params[:id])
  end

end
