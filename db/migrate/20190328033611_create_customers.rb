class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :fullname
      t.string :phone
      t.string :address
      t.string :city
      t.string :postalcode

      t.timestamps
    end
  end
end
