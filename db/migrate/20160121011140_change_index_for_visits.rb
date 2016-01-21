class ChangeIndexForVisits < ActiveRecord::Migration
  def change
    remove_index(:visitors, [:visitor_id, :short_url_id])
    add_index :visitors, :visitor_id
    add_index :visitors, :short_url_id
  end
end
