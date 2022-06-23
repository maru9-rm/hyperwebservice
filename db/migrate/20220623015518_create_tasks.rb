class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :content
      t.integer :status, null: false, default: 0
      t.integer :subject, null: false, default: 0
      t.timestamps
    end
  end
end
