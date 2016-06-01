class NotesController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json{render json: Note.all}
    end
  end
end
