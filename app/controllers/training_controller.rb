class TrainingController < ApplicationController

  def index
    redirect_to training_path(:build)
  end

  def show
    @training_categories = TrainingCategory.all.order(:id)
    @training_category = TrainingCategory.find_by_slug(params[:id])
  end

end
