class BoatsController < ApplicationController
  def home
  end

  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
