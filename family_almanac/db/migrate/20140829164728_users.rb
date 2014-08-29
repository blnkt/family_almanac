class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
    end
  end

  def self.up
    add_attachment :users, :avatar
  end

end
