class ProspectsController < ApplicationController
  def index
    @prospects = Prospects.all.order('created_at AESC')
  end
end
