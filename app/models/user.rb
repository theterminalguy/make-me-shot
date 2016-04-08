class User < ActiveRecord::Base
  acts_as_token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         password_length: 6..72

  validates :full_name, presence: true
  has_many :links

  scope :popular_users, lambda {
    order('links_count DESC').pluck(:full_name, :created_at, :links_count)
      .take(3)
  }
end
