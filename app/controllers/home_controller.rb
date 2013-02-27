class HomeController < ApplicationController
  def index
    @danger_campaigns = Campaign.where("date_add(start, interval length day) <= ?", Date.today).order("start ASC")
    @warning_campaigns = Campaign.where("date_add(start, interval length day) > ? and date_add(start, interval length day) <= ?", Date.today, 5.days.from_now).order("start ASC")
    
    @sql_debug = "@danger_campaigns = #{@danger_campaigns.to_sql}\r\n\r\n@warning_campaigns = #{@warning_campaigns.to_sql}"
  end
end
