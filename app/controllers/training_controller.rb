class TrainingController < ApplicationController

  before_action :get_background_image

  def index
    redirect_to training_build_path
  end

  def get_background_image
    @background_image = I18n.t("training.#{action_name}.background_image")
  end

end
