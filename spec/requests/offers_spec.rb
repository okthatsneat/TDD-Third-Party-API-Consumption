require 'spec_helper'

describe "Offer Pages", :vcr do
  
  subject { page }

  describe "create new offer" do
    before { visit new_offer_path }

    let(:submit) {'Create Offer'}
    
    describe "with invalid params" do
      it "should not create an offer" do
        expect { click_button submit }.not_to change(Offer, :count)
      end
    end

    describe "with valid params" do
      before do 
        fill_in "Uid", with: "player1"
        click_button submit
      end

      it "should create an Offer" do
        expect change(Offer, :count).by(1)        
      end  

      it "should create an Offer with default params set" do
        offer = Offer.find_by_uid("player1")
        offer.locale.should eq ENV['LOCALE']
        offer.request_timestamp.should_not be_nil
      end

      it "should display the offers page with either no content items, or all content items if present" do
        page.should satisfy do
          (page.has_css?(".offer")) || (page.has_css?(".no_offers"))
        end
      end
    end
  
    describe "with page attribute set to a value larger than offer pages coming from the api" do
      before do 
        fill_in "Uid", with: "player1"
        fill_in "Pub0", with: "campaign2"
        fill_in "Page", with: 10_000_000_000
        click_button submit
      end
      it "should not create any content items" do
        Offer.find_by_uid("player1").content_items.should be_empty
      end

    end
  end

  describe "an offer page that has offers" do
    before do 
      offer = FactoryGirl.create(:offer)
      @content_item = FactoryGirl.create(:content_item)
      @content_item.offer = offer
      visit offer_path(offer.id)
    end
    it "should display the offer title" do
      page.should have_css(".title", text: @content_item.title)
    end
    
    it "should display the lowres thumbnail" do
      page.should have_xpath("//img[contains(@src, \"#{@content_item.thumbnail[:lowres]}\")]")
    end

    it "should display the payout information" do
      page.should have_css(".payout", text: @content_item.payout)
    end
  end
end
