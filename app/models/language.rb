class Language < ApplicationRecord
    has_many :project_languages, dependent: :delete_all
    has_many :projects, through: :project_languages
end
