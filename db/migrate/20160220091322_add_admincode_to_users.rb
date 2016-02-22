class AddAdmincodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admincode, :string
  end
end
