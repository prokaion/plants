class WelcomeController < ApplicationController
  #require 'offer_runner.rb'
  def index
    offer_runner = OfferRunner.new
    offer_runner.runner
  end
end
