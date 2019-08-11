class LinkSerializer < ActiveModel::Serializer
  attributes :url
  belongs_to :user, serializer: UserSerializer
end
