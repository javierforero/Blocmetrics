class RegisteredAppsController < ApplicationController

  def show
    @registered_app = RegisteredApp.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @registered_app = RegisteredApp.new
  end

  def create

    @user = User.find(params[:user_id])
    @registered_app = RegisteredApp.new(app_params)
    @registered_app.user_id = @user.id

    if @registered_app.save
      flash[:notice] = "Your app was registered!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem registering you app. Please make you that you give it a name and a url and try again."
      render :new
    end
  end

  def destroy

    @user = User.find(params[:user_id])
    @registered_app = @user.registered_apps.find(params[:id])

    if @registered_app.destroy
      flash.now[:notice] = "#{@registered_app.name} was unregistered successfully."
    else
      flash.now[:alert] = "Sorry. We were unable to unregister #{@registered_app.name}"
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def app_params
    params.require(:registered_app).permit(:name, :url, :user_id)
  end
end
