class ChangeReservationFrom < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :from, :datetime
    add_column :reservations, :starting, :datetime
  end
end
