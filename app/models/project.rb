class Project < ApplicationRecord
    has_many :images, dependent: :destroy
    has_many :tasks
    has_many :project_languages, dependent: :destroy
    has_many :languages, through: :project_languages
    belongs_to :user
end
