class AddRefererToMeanings < ActiveRecord::Migration[5.0]
  def change
    add_column :meanings, :referer, :string
  end
end
