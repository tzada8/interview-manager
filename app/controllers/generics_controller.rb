class GenericsController < ApplicationController
  before_action :set_generic, only: %i[ show edit update add_to_interview create_interview_specific destroy ]
  before_action :set_question, only: %i[ show edit update add_to_interview create_interview_specific destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: %i[ show edit update add_to_interview create_interview_specific destroy ]

  # GET /generics or /generics.json
  def index
    @questions = Question.search(params[:q], current_user.get_generics)
  end

  # GET /generics/1 or /generics/1.json
  def show
  end

  # GET /generics/new
  def new
    @question = current_user.get_generics.build
  end

  # GET /generics/1/edit
  def edit
  end

  # POST /generics or /generics.json
  def create
    @question = current_user.get_generics.build(question_params)

    respond_to do |format|
      if @question.save
        @generic = Generic.create(question: @question)
        format.html { redirect_to generic_path(@generic), notice: "Generic was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /generics/1 or /generics/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @generic, notice: "Generic was successfully updated." }
        format.json { render :show, status: :created, location: @generic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @generic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /generics/1 or /generics/1.json
  def destroy
    # This generic points to a question, and so do many specifics
    @question.specifics.each do |specific|
      # Go through all specifics deleting them first, then delete the generic and question
      specific.destroy
    end
      @generic.destroy
      @question.destroy
    respond_to do |format|
      format.html { redirect_to generics_url, notice: "Generic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /generics/1/add_to_interview or /generics/1/add_to_interview.json
  def add_to_interview
  end

  # PATCH/PUT /generics/1 or /generics/1.json
  def create_interview_specific
    @interview = Interview.find(interview_params[:interview_id])

    respond_to do |format|
      if @interview.get_specifics.include?(@question)
        format.html { render :add_to_interview, notice: "This Generic Question already exists in Interview's Questions.", status: :unprocessable_entity }
        format.json { render json: @generic.errors, status: :unprocessable_entity }
      else
        Specific.create(interview: @interview, question: @question)
        format.html { redirect_to generics_url, notice: "Successfully added Generic Question as Specific Question to Interview." }
        format.json { render :index, status: :created, location: @generic }
      end
    end
  end

  def correct_user
    redirect_to generics_path, notice: "Not Authorized to Access This Generic" unless current_user.get_generics.include? @generic.question
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_generic
      @generic = Generic.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = @generic.question
    end

    # Only allow a list of trusted parameters through.
    def generic_params
      params.require(:generic).permit(:question_id)
    end

    # Params allowed for a question
    def question_params
      params.require(:question).permit(:prompt, :answer)
    end

    # Allow interview's id to add generic question to an interview's specific
    def interview_params
      params.require(:question).permit(:interview_id)
    end
end