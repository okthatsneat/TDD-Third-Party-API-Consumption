require 'spec_helper'

describe Offer do
  describe "Computing the security hash key" do 
    
    before(:each) do 
      @offer = FactoryGirl.create(:offer)
      @value_pairs = @offer.gather_security_hash_value_pairs
    end

    it "gathers all the parameters" do
      @value_pairs.should have_keys(:appid, :uid, :ip, :locale, :device_id, :ps_time, :pub0, :page, :timestamp, :offer_types)
      @value_pairs.should_not have_values('',nil)
    end

    it "orders all the key-value pairs alphabetically" do
      @value_pairs.keys.should eq [:appid, :device_id, :ip, :locale, :offer_types, :page, :ps_time, :pub0, :timestamp, :uid]
    end

    it "should concatenate all request parameters and hash key to a param string" do 
      @offer.api_request_string.should eq "appid=#{ENV['APPID']}&device_id=#{ENV['DEVICE_ID']}&ip=#{ENV['IP']}&"\
      "locale=#{@offer.locale}&offer_types=#{ENV['OFFER_TYPES']}&page=#{@offer.page}&"\
      "ps_time=#{@offer.created_at.to_i}&pub0=#{@offer.pub0}&"\
      "timestamp=#{@offer.request_timestamp.to_i}&uid=#{@offer.uid}&hashkey=#{@offer.sha1_string}"
    end

    it "should return a correct SHA1 Hash String" do
      @offer.sha1_string.should eq (
        Digest::SHA1.hexdigest @offer.gather_security_hash_value_pairs.to_param+"&#{ENV['API_KEY']}")
    end

    it "should return response code 200 with valid request but wrong user" do
      VCR.use_cassette "mobile_offer_api/valid" do
        response = @offer.mobile_offer_api_call
        response.should be_success 
      end
    end

  end

end
