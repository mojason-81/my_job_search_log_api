class Contact < ApplicationRecord
  belongs_to :company, class_name: "Company"
  accepts_nested_attributes_for :company
end
