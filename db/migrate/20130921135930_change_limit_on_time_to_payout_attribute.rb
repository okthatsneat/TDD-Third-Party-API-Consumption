class ChangeLimitOnTimeToPayoutAttribute < ActiveRecord::Migration
  def change
    change_column :content_items, :time_to_payout, :text, :limit => nil
  end
end
