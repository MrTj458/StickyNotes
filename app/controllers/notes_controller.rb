class NotesController < ApplicationController
  def index
    @notes = Note.order(created_at: :desc)
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    
    if @note.save
      redirect_to note_path(@note.id)
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to note_path(@note.id)
    else
      render :edit
    end
  end

  def destroy
    Note.destroy(params[:id])
    redirect_to notes_path
  end

  private

    def note_params
      params.require(:note).permit(:title, :body)
    end
end
