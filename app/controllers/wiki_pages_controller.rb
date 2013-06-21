class WikiPagesController < ApplicationController

  acts_as_wiki_pages_controller

  def all
          @pages = WikiPage.find(:all)
  end
  
 

end
