class AddProjectIdToImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :project, foreign_key: true
  end
end
