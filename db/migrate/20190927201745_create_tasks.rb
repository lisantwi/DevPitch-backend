class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :priority
      t.date :due_date
      t.references :project, foreign_key: true
    end
  end
end
