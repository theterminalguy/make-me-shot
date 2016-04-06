class RedirectController < ApplicationController
  before_action :short_link

  def show
    respond_to do |format|
      count = @short.click_count + 1
      @short.update_attributes(click_count: count)
      data = visitor_details(@short.id).to_hash
      Visit.create(data)
      format.html { redirect_to @short.long }
    end
  end

  private

  def visitor_details(id)
    BrowserDetail.new(request, id)
  end

  def short_link
    short_url = params[:short_url]
    @short = Link.where(short: short_url).first
    if @short.nil?
      redirect_to '/pages/deleted'
    elsif @short.active == false
      redirect_to '/pages/inactive'
    else
      @short
    end
  end

  def link_params
    params.require(:redirect).permit(:short_url)
  end
end
