class HomeController < ApplicationController
  def index
    redirect_to(:controller => "option", :action => "index")
  end
end
