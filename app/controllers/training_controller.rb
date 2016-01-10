class TrainingController < ApplicationController

  def index
    redirect_to training_path(TrainingCategory.first.slug)
  end

  def show
    @training_categories = TrainingCategory.all.order(:id)
    @training_category = TrainingCategory.find_by_slug(params[:id])
  end

end
