class CreateLeases < ActiveRecord::Migration[6.1]
  def change
    create_table :leases do |t|
      t.integer :apartment_id
      t.integer :tenant_id
      t.decimal :rent, precision: 4, scale: 2

      t.timestamps
    end
  end
end
