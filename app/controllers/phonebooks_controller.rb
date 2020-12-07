class PhonebooksController < ApplicationController
  before_action :set_phonebook, only: [:show, :edit, :update, :destroy]

  # GET /phonebooks
  # GET /phonebooks.json
  def index
    @phonebooks = Phonebook.all
  end

  # GET /phonebooks/1
  # GET /phonebooks/1.json
  def show
  end

  # GET /phonebooks/new
  def new
    @phonebook = Phonebook.new
  end

  # GET /phonebooks/1/edit
  def edit
  end

  # POST /phonebooks
  # POST /phonebooks.json
  def create
    @phonebook = Phonebook.new(phonebook_params)

    respond_to do |format|
      if @phonebook.save
        format.html { redirect_to @phonebook, notice: 'Phonebook was successfully created.' }
        format.json { render :show, status: :created, location: @phonebook }
      else
        format.html { render :new }
        format.json { render json: @phonebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phonebooks/1
  # PATCH/PUT /phonebooks/1.json
  def update
    respond_to do |format|
      if @phonebook.update(phonebook_params)
        format.html { redirect_to @phonebook, notice: 'Phonebook was successfully updated.' }
        format.json { render :show, status: :ok, location: @phonebook }
      else
        format.html { render :edit }
        format.json { render json: @phonebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phonebooks/1
  # DELETE /phonebooks/1.json
  def destroy
    @phonebook.destroy
    respond_to do |format|
      format.html { redirect_to phonebooks_url, notice: 'Phonebook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phonebook
      @phonebook = Phonebook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def phonebook_params
      params.require(:phonebook).permit(:name, :phone)
    end
end
