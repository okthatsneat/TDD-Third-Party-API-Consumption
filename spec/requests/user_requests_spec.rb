require 'spec_helper'

describe "UserRequests" do
  
  it "displays ad when submitting valid form" do
    visit new_user_request_path
    fill_in "Uid", with: "player1"
    fill_in "Pub0", with: "campaign2"
    fill_in "Page", with: 2
    click_button 'Create User request'
    page.should have_css 'div.title'
    page.should have_css 'div.thumbnail'
    page.should have_css 'div.lowres'
    page.should have_css 'div.payout'
    page.should have_css 'img', text: "lowres.jpg"
  end

  it "displays error when submitting invalid form" do
    visit new_user_request_path
    click_button 'Create User request'
    page.should have_content "Uid can't be blank"
  end



end
