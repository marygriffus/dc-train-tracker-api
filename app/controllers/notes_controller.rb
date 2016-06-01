class NotesController < ApplicationController

  def index
    @notes = Note.all
    render json: @notes.to_json, status: :ok
  end

  def create
    @note = @note.build(note_params)
    if @note.save
      render json: @note.to_json, status: :created
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      render json: @note.to_json, status: :ok
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    render json: {message: "success"}, status: :ok
  end

  private
  def note_params
    params.permit(:title, :author, :body, :station, :date)
  end
end
