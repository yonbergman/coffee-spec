class PostersController < ApplicationController

  include PostersSupport

  before_action :must_be_signed_in, only: [:update, :destroy, :index, :create]
  before_action :preload_poster, only: [:show, :update, :destroy]

  def index
    @posters = current_user.posters.order(:id)
  end

  def show
    @title = @poster.name
  end

  def create
    @poster = current_user.posters.build
    if @poster.save
      redirect_to @poster, notice: t('notice.poster.created')
    else
      redirect_to posters_path, error: t('notice.poster.failed_create')
    end
  end

  def update
    success = @poster.update(poster_params)
    respond_to do |format|
      format.html {
        if success
        redirect_to @poster, notice: t('notice.poster.updated')
        else
          redirect_to @poster, error: t('notice.poster.failed_update')
        end
      }
      format.json {render :json => @poster}
    end


  end

  def destroy
    @poster.destroy
    redirect_to posters_url, notice: t('notice.poster.deleted')
  end

  private

  def poster_params
    params.require(:poster).permit(:name)
  end
end
