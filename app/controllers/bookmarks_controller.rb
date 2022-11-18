class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    ap @bookmark
    if @bookmark.save
      redirect_to list_path(@list)
    else
      redirect_to lists_path(@list), status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :photo)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
