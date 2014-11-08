class GuineaPigController < ApplicationController
  def index
    head :ok
  end

  def create
    head :created
  end

  def create_and_reset_session
    reset_session
    head :created
  end
end