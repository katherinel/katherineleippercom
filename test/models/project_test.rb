require 'test_helper'

describe Project do
  it "should not save without a title, short description, or long description" do
    project = Project.new
    project.save
    project.errors.keys.must_include :title
    project.errors.keys.must_include :short_description
    project.errors.keys.must_include :long_description
  end
end
