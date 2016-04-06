class PagesController < ApplicationController
  def show
    render template: "pages/#{params[:page]}"
  end

  def index
    @link = Link.new
    @recent = Link.recently_added
    @popular_links = Link.popular_links
    @top_users = User.popular_users
  end
end
