class UsersController < Clearance::BaseController


  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def show
    render template: "users/show"
    # redirect_to user_path(current_user)
  end


  def url_after_create
    Clearance.configuration.redirect_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :last_name, :first_name, :phone_number, :dob)
  end
end
