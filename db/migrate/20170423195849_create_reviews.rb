class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :rating
      t.string :for_nurse
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
