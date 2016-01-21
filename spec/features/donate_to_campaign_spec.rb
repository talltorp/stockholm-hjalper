require "rails_helper"

feature "donating to a campaign" do
  scenario "when the donation mathces the funding_goal" do
    campaign = create(:campaign, funding_goal: 10)

    visit "/campaigns/#{campaign.id}"

    fill_in "donation_name", with: "Johnny"
    fill_in "donation_phone", with: "0707111222"
    fill_in "donation_email", with: "johnny@example.com"
    fill_in "donation_donation_amount", with: "34"

    click_button "Skicka"
    campaign.reload

    simulate_pm_clicking_confirmation_link_in_email(campaign)

    expect(campaign.fully_funded?).to be true
  end

  def simulate_pm_clicking_confirmation_link_in_email(campaign)
    donation = campaign.donations.last
    visit "/donations/#{ donation.id }/confirm/#{ donation.confirmation_code }"
  end
end
