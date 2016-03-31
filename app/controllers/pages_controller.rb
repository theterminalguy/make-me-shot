class PagesController < ApplicationController
  def show
    @link = Link.new 
    @recent = Link.recently_added
    @popular_links = Link.popular_links
    @top_users = User.popular_users
    render template: "pages/#{params[:page]}"
  end
  
  def index
    redirect_to "/pages/index" 
  end
end
