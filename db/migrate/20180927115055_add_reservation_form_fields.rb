class AddReservationFormFields < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :from, :time
    remove_column :reservations, :till, :time
    add_column :reservations, :from, :datetime
    add_column :reservations, :till, :datetime
  end
end
