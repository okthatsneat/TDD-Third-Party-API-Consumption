class CreateUserRequests < ActiveRecord::Migration
  def change
    create_table :user_requests do |t|
      t.string :uid
      t.string :pub0
      t.integer :page

      t.timestamps
    end
  end
end
