class UsersController < ApplicationController
  def show
    @user = current_user
    @meanings = Meaning.where(user_id: current_user.id).order("created_at DESC")
    @towa = Towa.new
    @towa.meanings.build(user_id: current_user.id)
  end
end
