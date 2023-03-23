class MakeCompanyAReferenceToCompany < ActiveRecord::Migration[7.0]
  def up
    remove_column :contacts, :company
    add_reference :contacts, :company, foreign_key: {to_table: :companies}
  end

  def down
    remove_reference :contacts, :company
    add_column :contacts, :company, :string
  end
end
