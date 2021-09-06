class SpecificsController < ApplicationController
  before_action :get_interview
  before_action :set_specific, only: %i[ show edit update_specific delete_specific ]
  before_action :authenticate_user!
  before_action :correct_user, only: %i[ index show edit update_specific destroy_specific ]

  # GET /specifics or /specifics.json
  def index
    @specifics = @interview.get_specifics
  end

  # GET /specifics/1 or /specifics/1.json
  def show
    @question = @specific.question
  end

  # GET /specifics/new
  def new
    @question = current_user.get_specifics.build
  end

  # GET /specifics/1/edit
  def edit
    @question = @specific.question
  end

  # POST /specifics or /specifics.json
  def create_specific
    @question = current_user.questions.build(specific_question_params)

    respond_to do |format|
      if @question.save
        @interview = Interview.find(params[:interview_id])
        @specific = @interview.specifics.build(question: @question)
        @specific.save
        format.html { redirect_to interview_specifics_path(@interview), notice: "Specific was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /specifics/1 or /specifics/1.json
  def update_specific
    @question = @specific.question
    
    respond_to do |format|
      if @question.update(specific_question_params)
        format.html { redirect_to interview_specifics_path(@interview), notice: "Specific was successfully updated." }
        format.json { render :show, status: :created, location: @specific }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @specific.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specifics/1 or /specifics/1.json
  def delete_specific
    @question = @specific.question    
    if @question.is_only_specific? # If question is only specific, then delete entire question
      @specific.destroy
      @question.destroy
    else # Else question is also generic, so just remove reference
      @specific.delete
    end
    respond_to do |format|
      format.html { redirect_to interview_specifics_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
      redirect_to interviews_path, notice: "Not Authorized to Access This specific" unless current_user.interviews.include? @interview
  end

  private
    # Gets this specific parent's interview
    def get_interview
      @interview = Interview.find(params[:interview_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_specific
      @specific = @interview.specifics.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def specific_params
      params.require(:specific).permit(:question_id, :interview_id)
    end

    # Params allowed for a question
    def specific_question_params
      params.require(:question).permit(:prompt, :answer)
    end
end
