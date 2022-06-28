class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :user
      t.boolean :done
      t.boolean :urgent
      t.boolean :important
      t.integer :user_id

      t.timestamps
    end
  end
end
