# app/models/entry.rb

class Entry < ActiveRecord::Base
  belongs_to :project
  validates  :project, presence: true

  # http://guides.rubyonrails.org/active_record_validations.html
  validates :hours,   numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 24 }
  validates :minutes, numericality: { only_integer: true, greater_than: 0, less_than: 60 }
  validates :date, presence: true
end
