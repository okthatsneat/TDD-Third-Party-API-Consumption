require 'spec_helper'

describe Offer do
  before do
    @offer = FactoryGirl.build(:offer)
  end

  describe ".get_offers" do
    context "with offers present" do
      before do
        offers = JSON.parse(offers_json) #offers_json is offers part of the the raw json coming from the mobile offer api
        SponsorPay::MobileOffer.any_instance
          .should_receive(:get_offers)
          .and_return(offers)
          @content_items = @offer.get_offers                  
      end

      it "returns content items" do
        @content_items.should have(2).content_items  # Helpers#offer_json has 2 offer elements      
      end

      it "creates offer associated content_items" do
        @offer.content_items.should have(2).content_items # Helpers#offer_json has 2 offer elements
      end

      it "sets all content_items attributes" do
        @offer.content_items.each_with_index do |content_item, index|
          @content_items[index].keys.each do |attribute|
            content_item.public_send(attribute.to_sym).should eq @content_items[index][attribute]
          end
        end        
      end

    end

    context "with no offers present" do
      before do
        no_offers = [] 
        SponsorPay::MobileOffer.any_instance
          .should_receive(:get_offers)
          .and_return(no_offers)
          @content_items = @offer.get_offers                  
      end
      
      it "should not return itmes" do
        @content_items.should be_empty
      end

      it "should not create offer associated content items" do
        @offer.content_items.should be_empty
      end
    end
  end

end
