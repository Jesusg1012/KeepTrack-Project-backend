class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end
  def create
    @user = User.create(user_params)
    if @user.valid?
      project = Project.create(title: "New Project", user_id: @user.id)
      UserMailer.with(user: @user).welcome_email.deliver_now
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end
  def reminder
    reminder = Reminder.create(imageable_id: current_user.id, imageable_type: "User", time: DateTime.now,title: "title", description: "description")
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :bio, :avatar, :name, :email, :number)
  end
end
