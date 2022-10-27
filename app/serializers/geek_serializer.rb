include ActionController::Serialization

class GeekSerializer < ActiveModel::Serializer
  attributes :name, :stack
end