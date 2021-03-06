class UsersController < Clearance::BaseController
  before_action :find_user, only: [:show, :edit, :update]
  def index
    @user = User.all
  end
  def new
    @user = User.new
    render template: "users/new"
  end

  def create
    @user = User.new(user_params)
    # @user.email_confirmation_token = Clearance::Token.new
    if @user.save
      sign_in @user
      redirect_to listings_path
      WelcomeMailer.welcome_email(@user).deliver_later(wait: 1.minute)
      # UserJob.perform_later(user)

      # UserMailer.registration_confirmation(@user).deliver_later

    else
      render template: "users/new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # byebug
    # @user = User.find(params[:id])
    if @user.update(user_params)
      # byebug
      sign_in @user
      flash[:success] = "Success!"
      redirect_to @user
    else
      flash[:danger] = "Error Updating User"
      render :edit
    end
  end

  def show
    @bookings = @user.bookings
    render template: "users/show"
    # redirect_to user_path(current_user)
  end

  def find_user
    @user = User.find(params[:id ])
  end


  def url_after_create
    Clearance.configuration.redirect_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :last_name, :first_name, :phone_number, :dob, :avatar)
  end
end
