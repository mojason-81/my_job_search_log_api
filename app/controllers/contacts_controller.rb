# TODO: Error handling on all my actions
class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.includes(:company)
    render json: @contacts, include: [:company]
  end

  # NOTE: Maybe I don't need the show route...
  def show
    render json: Contact.find(find_contact_params[:id])
  end

  def create
    ContactCreatorService.new(contact_attrs: contact_params, company_attrs: company_params).create
    render :ok
  end

  # NOTE: Maybe I don't need the update route....
  def update
    Contact.update!(contact_params)
    render :ok
  end

  def destroy
    # NOTE: Need to investigate.  Should be able to have an empty method here.
    #       I'm probalby making the call incorrectly from the font end.
    Contact.find(find_contact_params[:id]).destroy
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
    )
  end

  def company_params
    params.require(:contact).require(:company).permit(:name, :url)
  end
end
