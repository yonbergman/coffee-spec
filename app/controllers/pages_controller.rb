class PagesController < ApplicationController

  include PagesSupport

  before_action :must_be_signed_in, only: [:edit, :update, :destroy, :index, :new, :create]
  before_action :preload_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = current_user.pages.order(:id)
  end

  def show
  end

  def new
    @page = current_user.pages.build
  end

  def edit
  end

  def create
    @page = current_user.pages.build(page_params)

    if @page.save
      redirect_to @page, notice: 'Page was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @page.update(page_params)
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url, notice: 'Page was successfully destroyed.'
  end

  private
  def page_params
    params.require(:page).permit(:name)
  end
end
