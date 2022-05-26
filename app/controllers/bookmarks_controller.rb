class BookmarksController < ApplicationController
  before_action :find_list, only: %i[new create]
  before_action :set_bookmark, only: :destroy


  def new
    @bookmark = Bookmark.new
    @list = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render template: 'lists/show'
    end
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def find_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
