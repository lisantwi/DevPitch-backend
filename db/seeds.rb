# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Language.destroy_all
languages = ['Java', 'C', 'Python', 'C++', 'Visual Basic .NET', 'JavaScript', 'C#', 'PHP', 'SQL', 'Objective-C', 'Assembly Language', 'MATLAB', 'PERL', 'Object Pascal', 'R', 'Ruby', 'Visual Basic', 'Go', 'Groovy', 'SWIFT']

languages.each do |l|
    Language.create(name: l)
end