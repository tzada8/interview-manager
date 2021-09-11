class MyQuestionsController < ApplicationController
  before_action :set_my_question, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: %i[ show edit update destroy ]

  # GET /my_questions or /my_questions.json
  def index
    @questions = Question.search(params[:q], current_user.get_my_questions)
  end

  # GET /my_questions/1 or /my_questions/1.json
  def show
    @question = @my_question.question
  end

  # GET /my_questions/new
  def new
    @question = current_user.get_my_questions.build
  end

  # GET /my_questions/1/edit
  def edit
    @question = @my_question.question
  end

  # POST /my_questions or /my_questions.json
  def create
    @question = current_user.get_my_questions.build(question_params)

    respond_to do |format|
      if @question.save
        @my_question = MyQuestion.new(question: @question)
        @my_question.save
        format.html { redirect_to my_question_path(@my_question), notice: "Own Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_questions/1 or /my_questions/1.json
  def update
    @question = @my_question.question
    
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @my_question, notice: "Own Question was successfully updated." }
        format.json { render :show, status: :created, location: @my_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_questions/1 or /my_questions/1.json
  def destroy    
    @my_question.destroy
    @my_question.question.destroy
    respond_to do |format|
      format.html { redirect_to my_questions_url, notice: "Own Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    redirect_to my_questions_path, notice: "Not Authorized to Access This Own Question" unless current_user.get_my_questions.include? @my_question.question
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_question
      @my_question = MyQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def my_question_params
      params.require(:my_question).permit(:question_id)
    end

    # Params allowed for a question
    def question_params
      params.require(:question).permit(:prompt, :answer)
    end
end
