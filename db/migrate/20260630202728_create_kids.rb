class CreateKids < ActiveRecord::Migration[8.1]
  def change
    create_table :kids do |t|
      t.string :name
      t.date :date_of_birth
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
