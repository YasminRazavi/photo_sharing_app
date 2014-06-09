class UsersController < Devise::RegistrationsController
  def show
    @user = current_user
  end


end