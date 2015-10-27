require 'test_helper'

describe Category do
	it "won't save without a name" do
		category = Category.new
		category.save
		assert_includes category.errors[:name], "can't be blank"
	end
end