class ApiController < ApplicationController
  
  def initialzie(token)
    @token 
  end

  def short_it(url, slug)
    User.find_by_authentication_token(@token)
  end
  
  def popular_users
  end
  
  def popular_urls
    
  end
  
  def recently_added
    
  end
  
  private
  
  def set_api_params
  end
  
end



