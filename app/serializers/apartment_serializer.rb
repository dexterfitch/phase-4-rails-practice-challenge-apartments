class ApartmentSerializer < ActiveModel::Serializer
  attributes :number
  has_many :tenants
end
