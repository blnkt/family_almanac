class Photos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :user
      t.attachment :pic
    end
  end
end
