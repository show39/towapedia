class CreateMeanings < ActiveRecord::Migration[5.0]
  def change
    create_table :meanings do |t|
      t.integer :user_id
      t.integer :towa_id
      t.text    :meaning, null: false
      t.timestamps
    end
  end
end
