
class GenerateReportController < ApplicationController
	
	def index
		redirect_to static_pages_home_path
      flash[:alert] = "You will be receiving an email with report."
    FreshsalesAnalytics::trackEvent(cookies[:user_email], 'Generated Report')

     @key = 'mEltUY514mis89SaF7wVpjVppIYS1OVH'
      auth = 'Basic ' + Base64.encode64(@key + ':X').chomp
      response = HTTParty.post("https://api.segment.io/v1/track",
                               {
                                 :body =>  {"event" =>  "Generate_report" , "userId" => cookies[:user_email]}.to_json,
                                 :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json' , 'Authorization' => auth}
      })
end
end

