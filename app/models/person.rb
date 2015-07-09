class Person < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :projects, through: :participations

  # accepts_nested_attributes_for :participations
end
