# app/models/entry.rb

class Entry < ActiveRecord::Base
  belongs_to :project

  # http://guides.rubyonrails.org/active_record_validations.html
  validates :hours,   numericality: { integer: true, in: 0..24 }
  validates :minutes, numericality: { integer: true, in: 0..59 }
  validates :date, presence: true
end
