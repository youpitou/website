class PagesController < ApplicationController
  def index
    @title = "Home Page"
  end

  def about
    @title = "About Me"
  end

  def news
    @title = "News"
  end

  def contact
    @title = "Contact Me"
  end

end
