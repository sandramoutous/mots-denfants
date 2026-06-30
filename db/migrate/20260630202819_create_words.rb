class CreateWords < ActiveRecord::Migration[8.1]
  def change
    create_table :words do |t|
      t.string :baby_version
      t.string :real_meaning
      t.text :context
      t.date :said_on
      t.references :kid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
