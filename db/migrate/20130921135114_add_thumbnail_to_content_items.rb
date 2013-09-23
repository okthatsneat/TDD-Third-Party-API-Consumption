class AddThumbnailToContentItems < ActiveRecord::Migration
  def change
    add_column :content_items, :thumbnail, :text
  end
end
