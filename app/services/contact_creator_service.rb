class ContactCreatorService
  attr_writer :contact_attrs, :company_attrs

  def initialize(contact_attrs: {}, company_attrs: {})
    @contact_attrs = contact_attrs
    @company_attrs = company_attrs
  end

  def create
    # TODO: Error handling
    Contact.transaction do
      company = Company.find_or_create_by!(@company_attrs)
      contact = Contact.create!(@contact_attrs.merge!({company_id: company.id}))
    end
  end
end