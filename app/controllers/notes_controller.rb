class NotesController < ApplicationController

  def index
    @notes = Note.all
    render json: @notes.to_json, status: :ok
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      render json: @note.to_json, status: :created
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      render json: @note.to_json, status: :ok
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    render json: {message: "success"}, status: :ok
  end

  private
  def note_params
    params.require(:note).permit(:title, :author, :body, :station, :created_at)
  end
end
