class ChangeVisitorsToVisits < ActiveRecord::Migration
  def change
    rename_table :visitors, :visits
  end
end
