require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should not save without a title, short description, or long description" do
    project = Project.new
    assert !project.save
    assert_equal [:title, :short_description, :long_description], project.errors.keys
  end
end
