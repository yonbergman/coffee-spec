class PostersController < ApplicationController

  include PostersSupport

  before_action :must_be_signed_in, only: [:edit, :update, :destroy, :index, :new, :create]
  before_action :preload_poster, only: [:show, :edit, :update, :destroy]

  def index
    @posters = current_user.posters.order(:id)
  end

  def show
    @title = @poster.name
  end

  def new
    @poster = current_user.posters.build
  end

  def edit
  end

  def create
    @poster = current_user.posters.build(poster_params)

    if @poster.save
      redirect_to @poster, notice: 'Poster was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @poster.update(poster_params)
      redirect_to @poster, notice: 'Poster was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @poster.destroy
    redirect_to posters_url, notice: 'Poster was successfully destroyed.'
  end

  private
  def poster_params
    params.require(:poster).permit(:name)
  end
end
