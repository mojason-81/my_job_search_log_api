class ChangeDatetimeColumnsToDateColumns < ActiveRecord::Migration[7.0]
  def up
    change_column :contacts, :follow_up_on, :date
    change_column :contacts, :meet_on, :date
  end

  def down
    change_column :contacts, :follow_up_on, :datetime
    change_column :contacts, :meet_on, :datetime
  end
end
