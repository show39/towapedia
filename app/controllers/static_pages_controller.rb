class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @towa = Towa.new
      @towa.meanings.build(user_id: current_user.id)
      @user = current_user
      @current_user_meanings = Meaning.where(user_id: current_user.id)
    end
    @towas = Towa.all
    @meanings = Meaning.order("created_at DESC").includes(:towa, :user).page(params[:page])
  end

  def about
    if user_signed_in?
      @towa = Towa.new
      @towa.meanings.build(user_id: current_user.id)
      @user = current_user
      @current_user_meanings = Meaning.where(user_id: current_user.id)
    end
  end

  def dashboard
    if user_signed_in? && current_user.role == 1 or 2
      @user = current_user
    else
      redirect_to root_path
    end
    @users = User.page(params[:page])
    @towas = Towa.all
    @meanings = Meaning.all
    @lights = Light.all
  end
end
