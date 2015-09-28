class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.integer :like
      t.string :category
      t.text :description

      t.timestamps null: false
    end
  end
end
