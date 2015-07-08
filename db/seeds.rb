# this file is: db/seeds.rb

# to run the seeds, in the terminal enter:
# rake db:seed

# rubocop:disable all
puts " --- Deleting all Projects --- "
# rubocop:enable all
# this does also delete the Entries --> dependent: :destroy
Project.destroy_all

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

25.times do |number|
  project = Project.create!(
    name: "My name #{number}",
    description: name_generator
  )

  rand(1..6).times do
    create_entry_for(project)
  end
end
