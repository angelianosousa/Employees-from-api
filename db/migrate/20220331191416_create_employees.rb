class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :gender
      t.timestamps
    end
  end
end
