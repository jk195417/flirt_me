class BackstageController < ApplicationController
  authorize_resource class: :backstage
  layout 'backstage'
end
