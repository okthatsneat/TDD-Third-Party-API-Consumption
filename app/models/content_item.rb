class ContentItem < ActiveRecord::Base
  belongs_to :offer
  serialize :offer_types, Array
  serialize :thumbnail, Hash
  serialize :time_to_payout, Hash
end
