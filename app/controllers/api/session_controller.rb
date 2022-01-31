class Api::SessionController < ApplicationController
  # Login
  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if @user
      login!(@user)
      render 'api/users/show'
    else
      render json: ['The email and/or password combination is incorrect. Please try again.'], status: :unauthorized # 401
    end
  end

  #signout
  def destroy
    logout!
    render json: {}
  end
end
