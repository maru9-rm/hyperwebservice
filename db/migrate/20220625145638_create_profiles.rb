class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :long_term_goal
      t.string :short_term_goal
      t.date :birthday
      t.string :club
      t.text :memo
      t.timestamps
    end
  end
end
