# this file is: db/seeds.rb

# to run the seeds, in the terminal enter:
# rake db:seed

# rubocop:disable all
puts " --- Deleting all Projects --- "
# this does also delete the Entries --> dependent: :destroy
Project.destroy_all
puts " --- Deleting all People (MUHAHAHAHAHAA) --- "
# this does also delete the Entries --> dependent: :destroy
Person.destroy_all
# rubocop:enable all

def name_generator
  syllables = %w(ana isa ola mum sasa lola hihi)

  "#{syllables.sample}#{syllables.sample}#{syllables.sample}"
end

def create_entry_for(project)
  Entry.create!(
    project:  project,    # yes, we can pass in the object instead of the id
    comments: name_generator,
    minutes:  rand(0..59),
    hours:    rand(0..10),
    date:     rand(0..90).days.ago,
  )
end

%w(Will Pete Tony Jenny).each do |name|
  Person.create!(name: name)
end

25.times do |number|
  project = Project.create!(
    name: "My name #{number}",
    description: name_generator
  )

  rand(1..6).times do
    create_entry_for(project)
  end
end

Project.all.each do |project|
  Person.all.to_a.sample(rand(1..4)).each do |person|
    Participation.create!(project: project, person: person)
  end
end
