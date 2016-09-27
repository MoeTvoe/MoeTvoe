class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.text :address
      t.datetime :created_at
      t.datetime :finished_at

      t.timestamps null: false
    end
  end
end
