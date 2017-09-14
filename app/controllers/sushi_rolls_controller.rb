class SushiRollsController < ApplicationController
  before_action :set_sushi_roll, only: [:show, :edit, :update, :destroy]

  def index
    @sushi_rolls = current_user.sushi_rolls
  end

  def show
  end

  def new
    @sushi_rolls = current_user.sushi_rolls.new
  end

  def edit
  end

  def create
    @sushi_roll = current_user.sushi_rolls.new(sushi_roll_params)
    
    if @sushi_roll.save
      redirect_to @sushi_roll, notice: 'Sushi roll was successfully created.'
    else
      render :new
    end
  end

  def update
    if @sushi_roll.update(sushi_roll_params)
      redirect_to @sushi_roll, notice: 'Sushi roll was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sushi_roll = @sushi_roll.destroy
    redirect_to @sushi_roll, notice: 'Sushi roll was successfully destroyed.'
  end

  private

  def set_sushi_roll
    @sushi_roll = current_user.sushi_rolls.find(params[:id])    
  end

  def sushi_roll_params
    params.require(:sushi_roll).permit(:name, :price, :fish_type, :spicy)
  
  end
end
