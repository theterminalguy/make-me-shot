class Link < ActiveRecord::Base
  attr_accessor :short_url
  belongs_to :user, counter_cache: true
  has_many :visits
  before_create :to_short_url
  before_update :to_short_url
  validates :long, presence: true,
                   format: { with: %r{\A^http|https:\/\/},
                             notice: 'Please enter a valid URL' }

  validates_exclusion_of :short, in: %w(login logout
                                        register sigup
                                        index dashboard
                                        links recent_urls
                                        link new_short
                                        edit update
                                        delete destroy
                                        new show)

  scope :users_recent, lambda {
    order('created_at DESC')
  }

  scope :recently_added, lambda {
    order('created_at DESC')
      .pluck(:short).take(5)
  }

  scope :popular_links, lambda {
    order('click_count DESC')
      .select(:short, :click_count)
      .limit(5).to_a
  }

  def to_short_url
    self.short = if short.nil? || short.empty?
                   url_slug
                 else
                   short.to_s
                 end
  end

  def url_slug
    SecureRandom.urlsafe_base64(4)
  end
end
