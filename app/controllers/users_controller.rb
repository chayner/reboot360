class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :finish_signup, :profile, :choose_avatar, :destroy]

  def profile
    # authorize! :update, @user
    if request.patch? && params[:user]
      if @user.update(profile_params)
        sign_in(@user, :bypass => true)
        redirect_to :root, notice: 'Your profile was successfully updated.'
      else
        flash[:error] = "That email already exists. If this is you, please log in with another service and try reconnecting this service."
        @show_errors = true
      end
    else
      @user = User.find(current_user.id)
    end
  end

  def update
    # authorize! :update, @user
    respond_to do |format|
      if @user.update(user_params)
        sign_in(@user == current_user ? @user : current_user, :bypass => true)
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = current_user
    end

    def user_params
      accessible = [ :name, :phone, :email ] # extend with your own params
      accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
      params.require(:user).permit(accessible)
    end

    def profile_params
      accessible = [ :name, :phone, :email ]
      params.require(:user).permit(accessible)
    end
end
