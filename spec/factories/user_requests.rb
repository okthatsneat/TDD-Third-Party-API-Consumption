# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_request do
    uid "MyString"
    pub0 "MyString"
    page 1
    locale "de"
    request_timestamp Time.now
  end
end
