require 'test_helper'

describe Project do
	it "won't save without a title" do
		project = Project.new
		project.save
		assert_includes project.errors[:title], "can't be blank"
	end
end