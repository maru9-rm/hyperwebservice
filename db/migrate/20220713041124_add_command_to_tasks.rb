class AddCommandToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :command, :boolean
  end
end
