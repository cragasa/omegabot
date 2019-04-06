# frozen_string_literal: true

class PagesController < InheritedResources::Base
  http_basic_authenticate_with name: 'admin', password: 'password'

  def static
    @page = Page.find_by(permalink: params[:permalink])
  end

  private

  def page_params
    params.require(:page).permit(:title, :content, :permalink)
  end
end
