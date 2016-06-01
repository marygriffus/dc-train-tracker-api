class NotesController < ApplicationController

  def index
    @notes = Note.all
    render json: @notes.to_json, status: :ok
  end
end
