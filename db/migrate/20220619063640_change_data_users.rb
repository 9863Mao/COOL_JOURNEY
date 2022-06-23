class ChangeDataUsers < ActiveRecord::Migration[6.1]
  def up
    change_column(:users, :first_name, :string, limit: 10)
    change_column(:users, :last_name, :string, limit: 10)
    change_column(:users, :telephone_number, :string, limit: 12)
    change_column(:users, :user_nickname, :string, limit: 20)
    change_column(:users, :self_introduction, :string, limit: 50)
  end
  
  def down
    change_column(:users, :first_name, :string, null: true, limit: false)
    change_column(:users, :last_name, :string, null: true, limit: false)
    change_column(:users, :telephone_number, :string, null: true, limit: false)
    change_column(:users, :user_nickname, :string, null: true, limit: false)
    change_column(:users, :self_introduction, :string, null: true, limit: false)
  end
end
