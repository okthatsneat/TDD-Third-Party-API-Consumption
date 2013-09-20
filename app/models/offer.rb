class Offer < ActiveRecord::Base

  validates_presence_of :uid

  def gather_security_hash_value_pairs
    values = {
      appid: ENV['APPID'],
      uid: uid,
      ip: ENV['IP'],
      locale: locale,
      device_id: ENV['DEVICE_ID'],
      ps_time: self.created_at.to_i,
      pub0: pub0,
      page: page,
      timestamp: request_timestamp.to_i,
      offer_types: ENV['OFFER_TYPES']
    }
    Hash[values.sort]
  end

  def api_request_string
    request_hash = gather_security_hash_value_pairs
    request_hash.to_param+"&hashkey=#{sha1_string}"
  end

  def sha1_string
    string_to_hash = gather_security_hash_value_pairs.to_param + "&" + ENV['API_KEY']
    Digest::SHA1.hexdigest string_to_hash
  end

  def mobile_offer_api_call
    HTTParty.get("http://api.sponsorpay.com/feed/v1/offers.json?#{api_request_string}")           
  end



end



# APPID: 157
# DEVICE_ID: "2b6f0cc904d137be2 e1730235f5664094b 831186" 
# IP: 109.235.143.113 #(german IP)
# OFFER_TYPES: 112
# API_KEY: b07a12df7d52e6c118e5d47d3f9e60135b109a1f