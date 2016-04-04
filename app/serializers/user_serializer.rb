class UserSerializer < ActiveModel::Serializer
  attributes :email, :full_name, :created_at, :links_count
  
  def created_at
              object.created_at.strftime('%H:%M')
  end
end
