class TweepsController < ApplicationController
  before_action :set_tweep, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  
  # GET /tweeps or /tweeps.json
  def index
    @tweeps = Tweep.all.order("created_at DESC")
    @tweep = Tweep.new
  end

  # GET /tweeps/1 or /tweeps/1.json
  def show
  end

  # GET /tweeps/new
  def new
    @tweep = current_user.tweeps.build
  end

  # GET /tweeps/1/edit
  def edit
  end

  # POST /tweeps or /tweeps.json
  def create
    @tweep = current_user.tweeps.build(tweep_params)

    respond_to do |format|
      if @tweep.save
        format.html { redirect_to root_path, notice: "Tweep was successfully created." }
        format.json { render :show, status: :created, location: @tweep }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweep.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweeps/1 or /tweeps/1.json
  def update
    respond_to do |format|
      if @tweep.update(tweep_params)
        format.html { redirect_to @tweep, notice: "Tweep was successfully updated." }
        format.json { render :show, status: :ok, location: @tweep }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweep.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweeps/1 or /tweeps/1.json
  def destroy
    @tweep.destroy
    respond_to do |format|
      format.html { redirect_to tweeps_url, notice: "Tweep was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweep
      @tweep = Tweep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweep_params
      params.require(:tweep).permit(:tweep)
    end
end
