class AddPopularityToDestinations < ActiveRecord::Migration[7.1]
  def change
    add_column :destinations, :popularity, :string
  end
end
