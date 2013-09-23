class CreateContentItems < ActiveRecord::Migration
  def change
    create_table :content_items do |t|
      t.string :title
      t.string :teaser
      t.string :required_action
      t.string :link
      t.string :thumbnail_lowres
      t.string :thumbnail_highres
      t.string :payout
      t.string :time_to_payout
      t.integer :offer_id

      t.timestamps
    end
  end
end
