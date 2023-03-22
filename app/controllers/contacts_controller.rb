class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    render json: @contacts
  end

  def show
    render json: Contact.find(find_contact_params[:id])
  end

  def create
    Contact.create!(contact_params)
    render :ok
  end

  def update
    Contact.update!(contact_params)
    render :ok
  end

  private

  def find_contact_params
    params.permit(:id)
  end

  def contact_params
    params.permit(
      :id,
      :company,
      :contact_point,
      :contacted_on,
      :follow_up_on,
      :meet_on,
      :contact_type
    )
  end
end
