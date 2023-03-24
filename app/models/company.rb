class Company < ApplicationRecord
  has_many :contacts, class_name: "Contact", dependent: :destroy
end
