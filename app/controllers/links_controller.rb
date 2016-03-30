class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy, :index, :new, :recent]
  
  before_action :check_owner, only: [:show, :edit, :update, :destroy]
  
  def recent
    @recent = Link.recently_added
  end
  
  def popular_links
    @popular_links = Link.popular_links
  end
  
  def top_users
    @top_users = User.popular_users 
  end
  
  def index
    @links = current_user.links.users_recent
  end
  
  def show
  end
  
  def new
    if current_user
        @link = current_user.links.new
      else
        @link = Link.new 
    end
  end

  def edit
  end
  
  def create
    if current_user 
      @link = current_user.links.new(link_params)
    else
      @link = Link.new(link_params)
    end
    
    respond_to do |format|
      if @link.save
        format.html { redirect_to :back, notice: @link.short }
      else
        format.html { redirect_to :back }
      end
      
    end
  end
  
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to user_dashboard_path, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
  def check_owner
    if current_user.id != @link.user_id 
          flash[:notice] = "Access denied!"
          redirect_to user_dashboard_path 
    end
  end
  
  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:user_id, :long, :short, :active)
  end
end
