class RemoveColumnAvailable < ActiveRecord::Migration[5.2]
  def change
    remove_column :bikes, :available, :boolean
  end
end
