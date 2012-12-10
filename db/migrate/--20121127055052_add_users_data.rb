class AddUsersData < ActiveRecord::Migration
  def up
    User.create(:first_name => "Nabeel",:last_name => "Nizami",:email => "nabeel.nizami@hotmail.com",:password => "aaaaaa",:repassword => "aaaaaa")
    User.create(:first_name => "Ali",:last_name => "Mumtaz",:email => "ali.mumtaz@hotmail.com",:password => "aaaaaa",:repassword => "aaaaaa")
    User.create(:first_name => "Naeem",:last_name => "Serwar",:email => "naeem.serwar@hotmail.com",:password => "aaaaaa",:repassword => "aaaaaa")
    User.create(:first_name => "Test1",:last_name => "Test1",:email => "test1@test1.com",:password => "aaaaaa",:repassword => "aaaaaa")
    User.create(:first_name => "Test2",:last_name => "Test2",:email => "test2@test2.com",:password => "aaaaaa",:repassword => "aaaaaa")
    User.create(:first_name => "Test3",:last_name => "Test3",:email => "test3@test3.com",:password => "aaaaaa",:repassword => "aaaaaa")
    User.create(:first_name => "Test4",:last_name => "Test4",:email => "test4@test4.com",:password => "aaaaaa",:repassword => "aaaaaa")
  end

  def down
    drop_table :users
  end
end
