class AddNumberSoldToDestinations < ActiveRecord::Migration[7.1]
  def change
    add_column :destinations, :number_sold, :integer
  end
end
