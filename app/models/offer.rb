class Offer < ActiveRecord::Base

  validates_presence_of :uid
  has_many :content_items, dependent: :destroy

  def get_offers
    # get the content itmes array
    mobile_offer_client = SponsorPay::MobileOffer.new({
      uid: uid,
      locale: locale,
      pub0: pub0,
      page: page,
      timestamp: request_timestamp.to_i      
      }) 
    content_items = mobile_offer_client.get_offers
    #create associated content_item for array element
    content_items.each do |content_item|
      self.content_items.build(content_item).save 
    end
  end

end