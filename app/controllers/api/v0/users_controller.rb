class Api::V0::UsersController < Api::ApiController
  def create
    @user = User.new(users_params)

    if @user.save
      render @user
    else
      render :nothing
    end
  end

  private

  def users_params
    params.require(:user).permit(*policy(@user || User).permitted_attributes)
  end
end
