class RemoveDetailThumbnailFieldsFromContentItems < ActiveRecord::Migration
  def change
    remove_column :content_items, :thumbnail_lowres, :string
    remove_column :content_items, :thumbnail_highres, :string
  end
end
