# Exercise #10
# Fill the seeds file with some project creation statements.
# Create 25 projects with different names and different descriptions.

# this file is: db/seeds.rb

puts " --- Deleting all Projects --- "
Project.destroy_all

def name_generator
  syllables = %w(ana isa ola mum sasa lola hihi)

  "#{syllables.sample}#{syllables.sample}#{syllables.sample}"
end


25.times do |number|
  Project.create!(
    name: "My name #{number}",
    description: name_generator
  )
end


# to run the seeds, in the terminal enter:

# rake db:seed



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
