class StaticController < ApplicationController
  before_filter :local_user?

  def home
  end

  def privacy
  end

  def disclosure
  end

  def info
  end

  def employment
  end

  def thankyou
  end
end	
