class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false
      t.string :title
      t.text :content
      t.string :tag
      t.integer :status
      t.timestamps
    end
  end
end
