class PrayerMailer < ActionMailer::Base
  default :from => "aaron@jailbreakcreative.com"
	
	def prayer_confirmation(prayer, category, user)
	@category = category
	@user = user
	@prayer = prayer
	  mail(:to => user.email, :subject => "Your #{category.name} Prayer Request", :from => "prayers@socialprayernetwork.com ")
	end
end
