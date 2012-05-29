class StaticController < ApplicationController
  def welcome
    render :layout => 'static'
  end
end
