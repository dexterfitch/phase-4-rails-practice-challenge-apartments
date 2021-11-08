class Tenant < ApplicationRecord
    has_many :leases, dependent: :destroy
    has_many :apartments, through: :leases

    validates :name, presence: true
    validates :age, numericality: { greater_than: 17 }
end
