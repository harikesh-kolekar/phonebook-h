class McsInfosController < AdminController
  before_action :set_mcs_info, only: [:show, :edit, :update, :destroy]

  # GET /mcs_infos
  # GET /mcs_infos.json
  def index
    @mcs_infos = McsInfo.all
  end

  # GET /mcs_infos/1
  # GET /mcs_infos/1.json
  def show
  end

  # GET /mcs_infos/new
  def new
    @mcs_info = McsInfo.new
  end

  # GET /mcs_infos/1/edit
  def edit
  end

  # POST /mcs_infos
  # POST /mcs_infos.json
  def create
    @mcs_info = McsInfo.new(mcs_info_params)

    respond_to do |format|
      if @mcs_info.save
        format.html { redirect_to mcs_infos_url, notice: 'Mcs info was successfully created.' }
        format.json { render :show, status: :created, location: @mcs_info }
      else
        format.html { render :new }
        format.json { render json: @mcs_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mcs_infos/1
  # PATCH/PUT /mcs_infos/1.json
  def update
    respond_to do |format|
      if @mcs_info.update(mcs_info_params)
        format.html { redirect_to @mcs_info, notice: 'Mcs info was successfully updated.' }
        format.json { render :show, status: :ok, location: @mcs_info }
      else
        format.html { render :edit }
        format.json { render json: @mcs_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mcs_infos/1
  # DELETE /mcs_infos/1.json
  def destroy
    @mcs_info.destroy
    respond_to do |format|
      format.html { redirect_to mcs_infos_url, notice: 'Mcs info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mcs_info
      @mcs_info = McsInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mcs_info_params
      params.require(:mcs_info).permit(:info_type, :attachment)
    end
end
