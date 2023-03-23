class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.includes(:company)
    render json: @contacts, include: [:company]
  end

  def show
    render json: Contact.find(find_contact_params[:id])
  end

  def create
    # FIXME: Need to accept nested attributes for company
    #        name and url
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
    params.require(:contact).permit(
      :id,
      :company,
      :contact_point,
      :contacted_on,
      :follow_up_on,
      :meet_on,
      :contact_type,
      company_attributes: [
        :id,
        :name,
        :url
      ]
    )
  end
end
