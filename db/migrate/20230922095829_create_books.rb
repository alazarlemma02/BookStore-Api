class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
