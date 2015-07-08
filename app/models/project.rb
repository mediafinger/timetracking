# app/models/project.rb

class Project < ActiveRecord::Base
  has_many :entries, dependent: :destroy  # destroy all entries when the project is destroyed

  validates :name, presence: true, uniqueness: true

  def self.iron_find(date = Date.current)
    order("name ASC").where("created_at > ?", date).limit(10)
  end

  def self.clean_old(date = 1.week.ago)
    where("created_at < ?", date).destroy_all
  end

  def self.last_created(n)
    # raise ArgumentError unless n.is_a? Integer && n.in(1..25)
    order(created_at: :desc).limit(n)
  end

  def total_hours_in_month(month = Date.current.month, year = Date.current.year)
    dt = DateTime.new(year, month, 1)

    entries.where("date > ?", dt).where("date < ?", dt.end_of_month).sum(:hours)
  end
end
