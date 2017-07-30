class SearchController < ApplicationController
  def search
    @search_towas = Towa.where('towa LIKE(?)',"%#{search_params[:keyword]}%").order("created_at DESC").limit(108)
  end

  private
    def search_params
      params.permit(:keyword)
    end
end
