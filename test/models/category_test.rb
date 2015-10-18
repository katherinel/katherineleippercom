require 'test_helper'

describe Category do
	it "won't save without a name" do
		category = Category.new
		category.save
		category.errors[:name].must_include "can't be blank"
	end
end