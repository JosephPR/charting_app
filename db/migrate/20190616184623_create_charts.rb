class CreateCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :charts do |t|
      t.string :name
      t.string :image_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
