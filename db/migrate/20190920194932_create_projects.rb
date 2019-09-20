class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :description

      t.timestamps
    end
  end
end
