class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.boolean :done, default: false
      t.date :deadline

      t.timestamps
    end
  end
end
