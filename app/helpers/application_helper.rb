module ApplicationHelper
  
  def title 
  	basic_title = "Mathieu Robert Website"
  	if @title.nil?
  		basic_title
  	else
  	"#{basic_title} | #{@title}"
  	end
  end
  
end
