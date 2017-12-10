class Backstage::BaseController < ApplicationController
  authorize_resource class: :backstage
  layout 'backstage'
end
