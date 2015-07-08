require 'test_helper'

# http://guides.rubyonrails.org/testing.html

class EntryTest < ActiveSupport::TestCase
  def setup
    @project   = Project.create(name: "Ironhack")
    @arguments = {
      project: @project,
      hours: 1,
      minutes: 20,
      date: 1.day.ago
    }
  end

  def test_create_entry
    entry = Entry.create(@arguments)

    assert_equal @project.id, entry.reload.project_id
  end

  #testing the validations

  def test_create_entry_without_project_id
    @arguments.delete(:project)

    assert_raises(ActiveRecord::RecordInvalid, "Project can't be blank") do
      Entry.create!(@arguments)
    end
  end

  def test_create_entry_without_negative_hours
    @arguments[:hours] = -5

    assert_raises(ActiveRecord::RecordInvalid, "Hours must be greater than 0") do
      Entry.create!(@arguments)
    end
  end

  def test_create_entry_with_minutes_equal_0
    @arguments[:minutes] = 0

    entry = Entry.new(@arguments)

    assert entry.valid?
  end

  def test_create_entry_with_minutes_above_60
    @arguments[:minutes] = 66

    assert_raises(ActiveRecord::RecordInvalid, "Minutes must be less than 60") do
      Entry.create!(@arguments)
    end
  end

  def test_create_entry_without_date
    @arguments.delete(:date)

    assert_raises(ActiveRecord::RecordInvalid, "Date can't be blank") do
      Entry.create!(@arguments)
    end
  end
end
