class QuestionsController < ApplicationController
  before_action :get_interview
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = @interview.questions
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = @interview.questions.build
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = @interview.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to interview_questions_path(@interview), notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to interview_question_path(@interview), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to interview_questions_path(@interview), notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Gets this specific question's parent interview
    def get_interview
      @interview = Interview.find(params[:interview_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = @interview.questions.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:prompt, :answer, :interview_id)
    end
end
