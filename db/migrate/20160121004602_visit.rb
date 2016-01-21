class Visit < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.integer :visitor_id
      t.integer :short_url_id

      t.timestamps

    end
    add_index(:visitors, [:visitor_id, :short_url_id], unique: true)
  end
end
