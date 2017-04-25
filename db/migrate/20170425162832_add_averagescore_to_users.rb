class AddAveragescoreToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :average_score, :integer
  end
end
