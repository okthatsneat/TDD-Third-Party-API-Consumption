class AddLocaleAndRequestTimestampToUserRequest < ActiveRecord::Migration
  def change
    add_column :user_requests, :locale, :string
    add_column :user_requests, :request_timestamp, :datetime
  end
end
