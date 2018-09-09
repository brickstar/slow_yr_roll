class DashboardController < ApplicationController
  def index
    @song = Song.new
  end

  def create
    binding.pry
  end
end
