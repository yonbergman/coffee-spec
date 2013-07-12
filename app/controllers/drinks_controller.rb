class DrinksController < ApplicationController
  include PagesSupport

  before_action :preload_page
  before_action :set_drink, only: [:edit, :update, :destroy]


  def show
    redirect_to @page
  end

  def new
    @drink = current_page.drinks.build
  end

  def edit
  end

  def create
    @drink = current_page.drinks.build(drink_params)

    if @drink.save
      redirect_to @page, notice: 'Drink was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /drinks/1
  def update
    if @drink.update(drink_params)
      redirect_to @page, notice: 'Drink was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /drinks/1
  def destroy
    @drink.destroy
    redirect_to @page, notice: 'Drink was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink
      @drink = Drink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def drink_params
      params.require(:drink).permit([:name, :kind] + Drink.stored_attributes[:drink_attributes])
    end
end
