class ProjectLanguage < ApplicationRecord
  belongs_to :project
  belongs_to :language
  validates :name, :uniqueness
end
