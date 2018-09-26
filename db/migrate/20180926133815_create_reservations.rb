class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.time :from
      t.time :till
      t.integer :employee_id
      t.integer :bike_id

      t.timestamps
    end
  end
end
