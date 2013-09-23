class ChangeTimeToPayoutAttributeInContentItemsToText < ActiveRecord::Migration
  def change
    change_column :content_items, :time_to_payout, :text
  end
end
