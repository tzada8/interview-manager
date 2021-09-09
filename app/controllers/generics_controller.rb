class GenericsController < ApplicationController
  before_action :set_generic, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: %i[ show edit update destroy ]

  # GET /generics or /generics.json
  def index
    @generics = Question.search(params[:q], current_user.get_generics)
  end

  # GET /generics/1 or /generics/1.json
  def show
  end

  # GET /generics/new
  def new
    @generic = current_user.get_generics.build
  end

  # GET /generics/1/edit
  def edit
  end

  # POST /generics or /generics.json
  def create
    @generic = current_user.get_generics.build(generic_params)

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

  def correct_user
    @generic = current_user.get_generics.find_by(id: params[:id])
    redirect_to generics_path, notice: "Not Authorized to Access This Question" if @generic.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generic
      @generic = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def generic_params
      params.require(:generic).permit(:question_id)
    end
end