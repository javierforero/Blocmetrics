class RegisteredAppsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @registered_app = RegisteredApp .new
  end

  def create
    @registered_app = RegisteredApp.new
    @registered_app.name = params[:registered_app][:name]
    @registered_app.url = params[:registered_app][:url]
    @registered_app.user_id = @user.id

    if @registered_app.save
      flash[:notice] = "Your app was registered!"
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem registering you app. Try again."
      render :new
    end
  end

  def edit
  end

  def destroy
  end
end
