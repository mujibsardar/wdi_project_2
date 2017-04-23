class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :for_nurse, :user_email
  end
end
