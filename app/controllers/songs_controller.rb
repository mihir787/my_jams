class SongsController < ApplicationController
  def index
    @songs = current_user.songs
  end

  def show
    @song = current_user.songs.find(params[:id])
  end

  def new
    @song = current_user.songs.new
  end

  def create
    @song = current_user.songs.new(song_params)
    if @song.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
    @song = current_user.songs.find(params[:id])
  end


  def update
    @song = current_user.songs.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = current_user.songs.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end


  private

  def song_params
    params.require(:song).permit(:title, :artist, :user_id, :tag_id)
  end
end
