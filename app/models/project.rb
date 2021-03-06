# app/models/project.rb

class Project < ActiveRecord::Base
  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :logo, content_type: %r{\Aimage\/.*\Z}

  has_many :entries, dependent: :destroy  # destroy all entries when the project is destroyed
  has_many :participations, dependent: :destroy
  has_many :people, through: :participations

  validates :name, presence: true, uniqueness: true

  def self.iron_find(date = Time.zone.today)
    order("name ASC").where("created_at > ?", date).limit(10)
  end

  def self.clean_old(date = 1.week.ago)
    where("created_at < ?", date).destroy_all
  end

  def self.last_created(n)
    # raise ArgumentError unless n.is_a? Integer && n.in(1..25)
    order(created_at: :desc).limit(n)
  end

  def total_hours_in_month(month = Time.zone.today.month, year = Time.zone.today.year)
    dt = Time.zone.parse("#{year}-#{month}-1")

    entries.where("date > ?", dt).where("date < ?", dt.end_of_month).sum(:hours)
  end
end
