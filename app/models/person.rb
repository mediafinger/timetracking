class Person < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :projects, through: :participations
end
