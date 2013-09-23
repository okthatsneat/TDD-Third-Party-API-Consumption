module Helpers
  def offers_json
    <<-eos
      [
        {
          "title": "Tap Fish",
          "teaser": " Download and START ",
          "required_action": "Download and START",
          "link": "http://iframe.sponsorpay.com/mbrowser?appid=157&lpid=11387&uid=player1", "offer_types": 
            [
              {
              "offer_type_id": "101",
              "readable": "Download"
              },
              {
              "offer_type_id": "112",
              "readable": "Free"
              }
            ],
          "thumbnail": 
            {
              "lowres": "http://cdn.sponsorpay.com/assets/1808/icon175x175-2_square_60.png",
               "hires": "http://cdn.sponsorpay.com/assets/1808/icon175x175-2_square_175.png"
            },
          "payout": "90", "time_to_payout":
            {
              "amount": "1800",
              "readable": "30 minutes"
            }
        },
        {
          "title": "Another Tap Fish",
          "teaser": " Download and START ",
          "required_action": "Download and START",
          "link": "http://iframe.sponsorpay.com/mbrowser?appid=157&lpid=11387&uid=player1", "offer_types": 
            [
              {
              "offer_type_id": "101",
              "readable": "Download"
              },
              {
              "offer_type_id": "112",
              "readable": "Free"
              }
            ],
          "thumbnail": 
            {
              "lowres": "http://cdn.sponsorpay.com/assets/1808/icon175x175-2_square_60.png",
               "hires": "http://cdn.sponsorpay.com/assets/1808/icon175x175-2_square_175.png"
            },
          "payout": "90", "time_to_payout":
            {
              "amount": "1800",
              "readable": "30 minutes"
            }
        }
      ]
    eos
  end
end