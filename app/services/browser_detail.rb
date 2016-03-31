class BrowserDetail
  attr_reader :request, :link_id
  
  def initialize(request_object, link_id)
    @request = request_object
    @link_id = link_id
  end
  
  def browser
    agent.browser
  end
  
  def browser_version
    agent.version
  end
  
  def os
    agent.platform
  end
  
  def ip
    request.remote_ip
  end
  
  def referer
    request.referer
  end
  
  def to_hash
    {
      link_id: link_id,
      browser: browser,
      browser_version: browser_version,
      os: os,
      ip: ip,
      referer: referer 
    }
  end
  
  private
  
  def agent
    @agent ||= UserAgent.parse(request.user_agent)
  end
end