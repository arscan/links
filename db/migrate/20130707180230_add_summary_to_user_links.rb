class AddSummaryToUserLinks < ActiveRecord::Migration
  def change
    add_column :userlinks, :summary, :text
  end
end
