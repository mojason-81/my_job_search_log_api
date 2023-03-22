class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.date :contacted_on
      t.string :company
      t.string :contact_point
      t.string :type
      t.datetime :follow_up_on
      t.datetime :meet_on
    end
  end
end