module Api::V1
  class UsersController < Api::V1::BaseController
      skip_before_filter :verify_authenticity_token
      before_action :set_user, only: [:info, :links]
      
      
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
end


