require 'spec_helper'

describe SponsorPay::MobileOffer do
  describe "Computing the security hash key" do
    before do
      @mobile_offer_client = SponsorPay::MobileOffer.new({uid: "player1", pub0: "campaign1", page: 1, locale: "de", timestamp: Time.now}) 
      @value_pairs = @mobile_offer_client.gather_security_hash_value_pairs
    end


    it "gathers all the parameters" do
      @value_pairs.should have_keys(:appid, :uid, :ip, :locale, :device_id, :pub0, :page, :timestamp, :offer_types)
      @value_pairs.should_not have_values('',nil)
    end

    it "orders all the key-value pairs alphabetically" do
      @value_pairs.keys.should eq [:appid, :device_id, :ip, :locale, :offer_types, :page, :pub0, :timestamp, :uid]
    end

    it "should concatenate all request parameters and hash key to a param string" do 
      @mobile_offer_client.api_request_string.should eq "appid=#{ENV['APPID']}&device_id=#{ENV['DEVICE_ID']}&ip=#{ENV['IP']}&"\
      "locale=#{@mobile_offer_client.locale}&offer_types=#{ENV['OFFER_TYPES']}&page=#{@mobile_offer_client.page}&"\
      "pub0=#{@mobile_offer_client.pub0}&"\
      "timestamp=#{@mobile_offer_client.request_timestamp.to_i}&uid=#{@mobile_offer_client.uid}&hashkey=#{@mobile_offer_client.sha1_string}"
    end

    it "should return a correct SHA1 Hash String" do
      @mobile_offer_client.sha1_string.should eq (
        Digest::SHA1.hexdigest @mobile_offer_client.gather_security_hash_value_pairs.to_param+"&#{ENV['API_KEY']}")
    end
  end

  describe ".get_offers", :vcr do
    context "with valid params" do
      before (:each) do
        @offer = FactoryGirl.build(:offer) 
        offer_params = {
          uid: @offer.uid,
          locale: @offer.locale,
          pub0: @offer.pub0,
          page: @offer.page,
          timestamp: @offer.request_timestamp.to_i
        }
        @mobile_offer_client = SponsorPay::MobileOffer.new(offer_params)
        @response = @mobile_offer_client.get_response
      end

      context "with response validation passing" do
        
        it "returns a valid response with status 200 ok" do
          @response.should be_success 
        end

        it "should not raise failed_response_validation error" do
          expect { @mobile_offer_client.validate_response(@response) }.not_to raise_error 
        end

        it "should contain offers if the code says OK" do
          if @response.body["code"] == "OK"
            @response.body["offers"].should_not be_empty
            @response.body["offers"][0].keys should eq [
              "title", "teaser", "required_action", "link",
              "payout", "time_to_payout", "offer_id", "offer_types","thumbnail"
            ]
          end          
        end

        it "should contain no offers if the code says NO_CONTENT" do
          if @response.body["code"] == "NO_CONTENT"
            @response.body["offers"].should be_empty
          end
        end        
      end

      context "with response validation not passing" do
        before do
          @response.instance_exec("fake"){ |x| @body = x}
        end
        
        it "should raise response validation error if the response has been modified" do                   
          expect {@mobile_offer_client.validate_response(@response)}.to raise_error       
        end

        it "should return no offers" do
          HTTParty.should_receive(:get).and_return(@response)
          offers = @mobile_offer_client.get_offers
          offers.should be_empty                   
        end      
      end    
    end
          
    context "calling .get_offers with invalid initialization" do
      it "raises an error" do
        invalid_client = SponsorPay::MobileOffer.new
        expect {invalid_client.get_offers}.to raise_error  
      end
      
    end

  end  
end