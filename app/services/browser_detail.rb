class BrowserDetail
  attr_reader :request, :link_id

  def initialize(request_object, link_id)
    @request = request_object
    @link_id = link_id
  end

  def to_hash
    {
      link_id: link_id,
      browser: agent.browser,
      browser_version: agent.version,
      os: agent.platform,
      ip: request.remote_ip,
      referer: request.referer
    }
  end

  private

  def agent
    @agent ||= UserAgent.parse(request.user_agent)
  end
end
