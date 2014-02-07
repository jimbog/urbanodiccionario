class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]

  # GET /words
  # GET /words.json
  def index
    @words = Word.all
  end

  # GET /words/1
  # GET /words/1.json
  def show
    @words = Word.where("name like ? AND verified = ?", @word.name, true)
  end

  # GET /words/new
  def new
    @word = Word.new
  end

  # GET /words/1/edit
  def edit
  end

  # POST /words
  # POST /words.json
  def create
    Rails.logger.debug "DEBUG: params are #{params}"
    Rails.logger.debug "DEBUG: author params are #{params[:author]}"
    Rails.logger.debug "DEBUG: word_params are #{word_params}"

    @word = Word.new(word_params)
    @author = @word.build_author(:email => author_params[:email], :pseudonym => author_params[:pseudonym])

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render action: 'show', status: :created, location: @word }
      else
        format.html { render action: 'new' }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /words/1
  # PATCH/PUT /words/1.json
  def update
    respond_to do |format|
      if @word.update(word_params)
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.json
  def destroy
    @word.destroy
    respond_to do |format|
      format.html { redirect_to words_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_word
    @word = Word.friendly.find(params[:id])
  end

  def author_params
   params[:author] 
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def word_params
    params.require(:word).permit(:name, :definition, :example, author: [:pseudonym, :email])
  end
end
