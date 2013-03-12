class HomeController < ApplicationController  
  def index
    @campaigns = Campaign.where("DATE_ADD(start, INTERVAL length DAY) <= ? AND complete = 0", 10.days.from_now).order("DATE_ADD(start, INTERVAL length DAY) ASC")
    @link_indexes = Campaign.where("links_index <= ?", 10.days.from_now).order("links_index ASC")
    
    #@sql_debug = "@campaigns = " << @campaigns.to_sql << "\n\n" << "@link_indexes = " << @link_indexes.to_sql
  end
end
