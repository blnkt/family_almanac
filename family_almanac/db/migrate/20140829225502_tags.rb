class Tags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.belongs_to :user
      t.belongs_to :photo
    end
  end
end
