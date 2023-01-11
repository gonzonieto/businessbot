class AddFavouriteToQueries < ActiveRecord::Migration[7.0]
  def change
    add_column :queries, :favourite, :boolean, default: false, null: false
  end
end
