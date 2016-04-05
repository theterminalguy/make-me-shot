module ApplicationHelper
  def full_url(url)
    request.base_url + '/' + url 
  end
  
  def notify
    if flash[:notice].present?
      msg = flash[:notice]
      toast = <<-NOTICE
        <script>Materialize.toast("#{msg}", 3000)</script>
      NOTICE
      
      toast.html_safe 
    end 
  end
  
  def active_class(link_path, css)
   current_page?(link_path) ? css : ""
  end
end
