class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @meanings = Meaning.where(user_id: @user.id).order("created_at DESC").includes(:towa, :user).page(params[:page])
    @towa = Towa.new
    @towa.meanings.build(user_id: @user.id)
    @current_user_meanings = Meaning.where(user_id: @user.id)
  end
end
