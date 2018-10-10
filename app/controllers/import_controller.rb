class ImportController < ApplicationController
  def create
    @import = Import.new(file:"status.csv")
    @import.save
    if @import.save
      redirect_to static_pages_home_path
      flash[:alert] = "Import is successfull. 200 records created."
      FreshsalesAnalytics::trackEvent(cookies[:user_email], 'Import')
      @key = 'mEltUY514mis89SaF7wVpjVppIYS1OVH'
      auth = 'Basic ' + Base64.encode64(@key + ':X').chomp
      response = HTTParty.post("https://api.segment.io/v1/track",
                               {
                                 :body =>  {"event" =>  "Import" , "userId" => cookies[:user_email]}.to_json,
                                 :headers => {'Content-Type' => 'application/json', 'Accept' => 'application/json' , 'Authorization' => auth}
      })
  end
end
end
