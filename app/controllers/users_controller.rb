class UsersController < Clearance::UsersController
  def index
    @users = User.all
  end

  def create
    @user = user_from_params

    if @user.save
      redirect_back_or url_after_create
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:store_id, :name, :email, :password)
  end

  def url_after_create
    root_url
  end

  def user_from_params
    if params[:user]
      User.new(user_params)
    else
      User.new
    end
  end
end
