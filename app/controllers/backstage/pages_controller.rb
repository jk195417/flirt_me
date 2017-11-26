class Backstage::PagesController < ApplicationController
  authorize_resource class: :backstage

  def index
  end
end
