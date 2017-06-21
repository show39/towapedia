class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @towa = Towa.new
      @towa.meanings.build(user_id: current_user.id)
      @user = current_user
    end
    @meanings = Meaning.order("created_at DESC").includes(:towa, :user)
  end
end
