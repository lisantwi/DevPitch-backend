class Project < ApplicationRecord
    has_many :images
    has_many :project_languages
    has_many :languages, through: :project_languages
    belongs_to :user, dependent: :destroy
end
