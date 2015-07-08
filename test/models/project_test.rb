require 'test_helper'

# http://guides.rubyonrails.org/testing.html

class ProjectTest < ActiveSupport::TestCase
  def setup
    @name = "Ironhack"
  end

  def test_create_project
    project = Project.create(name: @name)

    assert_equal @name, project.reload.name
  end

  def test_create_project_with_same_name
    Project.create(name: @name)

    assert_raises(ActiveRecord::RecordInvalid, "Name has already been taken") do
      Project.create!(name: @name)
    end
  end
end
