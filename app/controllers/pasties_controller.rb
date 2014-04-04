class PastiesController < ApplicationController
  before_action :set_pastie, only: [:show, :destroy, :image]

  def image
    send_data @pastie.image.data
  end

  # GET /pasties
  # GET /pasties.json
  def index
    @pasties = Pastie.all
  end

  # GET /pasties/1
  # GET /pasties/1.json
  def show
  end

  # GET /pasties/new
  def new
    @pastie = Pastie.new
  end

  # POST /pasties
  # POST /pasties.json
  def create
    @pastie = Pastie.new(pastie_params)
    @pastie.image = BSON::Binary.new(params["pastie"]["image"].read) if params["pastie"]["image"]

    respond_to do |format|
      if @pastie.save!
        format.html { redirect_to @pastie, notice: 'Pastie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pastie }
      else
        format.html { render action: 'new' }
        format.json { render json: @pastie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pasties/1
  # DELETE /pasties/1.json
  def destroy
    @pastie.destroy
    respond_to do |format|
      format.html { redirect_to pasties_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pastie
    @pastie = Pastie.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pastie_params
    params.require(:pastie).permit(:text)
  end
end
