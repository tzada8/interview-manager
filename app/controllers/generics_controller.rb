class GenericsController < ApplicationController
  before_action :set_generic, only: %i[ show edit update destroy ]

  # GET /generics or /generics.json
  def index
    @generics = Generic.all
  end

  # GET /generics/1 or /generics/1.json
  def show
  end

  # GET /generics/new
  def new
    @generic = Generic.new
  end

  # GET /generics/1/edit
  def edit
  end

  # POST /generics or /generics.json
  def create
    @generic = Generic.new(generic_params)

    respond_to do |format|
      if @generic.save
        format.html { redirect_to @generic, notice: "Generic was successfully created." }
        format.json { render :show, status: :created, location: @generic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @generic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generics/1 or /generics/1.json
  def update
    respond_to do |format|
      if @generic.update(generic_params)
        format.html { redirect_to @generic, notice: "Generic was successfully updated." }
        format.json { render :show, status: :ok, location: @generic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @generic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generics/1 or /generics/1.json
  def destroy
    @generic.destroy
    respond_to do |format|
      format.html { redirect_to generics_url, notice: "Generic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generic
      @generic = Generic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def generic_params
      params.require(:generic).permit(:prompt, :answer)
    end
end
