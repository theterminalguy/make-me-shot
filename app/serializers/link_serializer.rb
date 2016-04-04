class LinkSerializer < ActiveModel::Serializer
  attributes :id, :long, :short, :created_at, :click_count, :active
end
