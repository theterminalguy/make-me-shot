class Api::V1::UsersController < ApplicationController
  respond_to :json
  #before_filter :find_user, only: [:show, :update, :destroy]
  skip_before_filter :authenticate_user!, only: [:info, :links, :recent, :popular_urls, :popular_users]
  
  def info 
        render json: set_user  
  end
        
  def links
    render json: set_user.links 
  end
    
  def recent
    @recent = Link.order("created_at desc")
    render json: @recent 
  end

  def popular_urls
    @popular_links = Link.api_popular_links
    render json: @popular_links 
  end

  def popular_users
    @top_users = User.api_popular_users
    render json: @top_users 
  end

  private
  
  def set_user
    @user = User.find_by_authentication_token(params[:auth_token])    
  end
    
  def user_params
    params.require(:user).permit(:auth_token)
  end
end  
