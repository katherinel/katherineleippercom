class ContactsController < ApplicationController
  def new
  end

  def create
  	@contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :phone, :met)
	end
end