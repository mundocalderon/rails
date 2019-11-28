class FormStepsController < ApplicationController
  include Wicked::Wizard
  steps :address, :contact
end
