class AddOfferTypesToContentItems < ActiveRecord::Migration
  def change
    add_column :content_items, :offer_types, :text
  end
end
