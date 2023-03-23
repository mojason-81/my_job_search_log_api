class Company < ApplicationRecord
  has_one :contact, class_name: "Contact"
end
