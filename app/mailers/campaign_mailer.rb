class CampaignMailer < ApplicationMailer
  default from: "info@stockholmhjalper.se"

  def notify_pm_of_donation(donation)
    subject = I18n.t("email.notify_pm_of_donation.subject")
    @donation = donation
    @confirmation_url = "#{donation_url(@donation)}/confirm/#{@donation.confirmation_code}"

    mail(to: donation.campaign.contact_email, subject: subject)
  end

  def send_thank_you_to_donor(donation)
    subject = I18n.t("email.send_thank_you_to_donor.subject")
    @donation = donation

    mail(to: donation.email, subject: subject)
  end
end
