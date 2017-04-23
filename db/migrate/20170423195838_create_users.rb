class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :headline
      t.text :bio
      t.string :city
      t.string :state
      t.string :nurse_type
      t.string :agency
      t.string :image
      t.boolean :nurse

      t.timestamps
    end
  end
end
