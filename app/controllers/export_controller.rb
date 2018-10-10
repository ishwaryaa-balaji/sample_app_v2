class ExportController < ActionController::Base
 def index
 redirect_to static_pages_home_path(alert: true)
 flash[:alert] = "You will be receiving an email shortly with exported data."
  FreshsalesAnalytics::trackEvent(cookies[:user_email], 'Export')
   @key = 'mEltUY514mis89SaF7wVpjVppIYS1OVH'
      auth = 'Basic ' + Base64.encode64(@key + ':X').chomp
      response = HTTParty.post("https://api.segment.io/v1/track",
                               {
                                 :body =>  {"event" =>  "Export" , "userId" => cookies[:user_email]}.to_json,
                                 :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json' , 'Authorization' => auth}
      })
 end
end