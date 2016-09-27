class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.datetime :created_at
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
