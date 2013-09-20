class AddLocaleAndRequestTimestampToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :locale, :string
    add_column :offers, :request_timestamp, :datetime
  end
end
