class TenantSerializer < ActiveModel::Serializer
  attributes :name, :age, :total_rent, :apartments_with_rent
  has_many :apartments

  def total_rent
    all_rents = object.leases.map do |lease|
      lease.rent
    end
    all_rents.sum
  end

  def apartments_with_rent
    all_leases = object.leases.map do |lease|
      "Apartment: #{Apartment.find(lease.apartment_id).number} - Rent: #{lease.rent}"
    end
    all_leases
  end
end
