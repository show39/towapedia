class CreateTowas < ActiveRecord::Migration[5.0]
  def change
    create_table :towas do |t|
      t.string :towa, null: false, unique: true

      t.timestamps
    end
    add_index :towas, :towa
  end
end
