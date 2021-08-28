class MyQuestionsController < ApplicationController
  before_action :set_my_question, only: %i[ show edit update destroy ]

  # GET /my_questions or /my_questions.json
  def index
    @my_questions = MyQuestion.all
  end

  # GET /my_questions/1 or /my_questions/1.json
  def show
  end

  # GET /my_questions/new
  def new
    @my_question = MyQuestion.new
  end

  # GET /my_questions/1/edit
  def edit
  end

  # POST /my_questions or /my_questions.json
  def create
    @my_question = MyQuestion.new(my_question_params)

    respond_to do |format|
      if @my_question.save
        format.html { redirect_to @my_question, notice: "My question was successfully created." }
        format.json { render :show, status: :created, location: @my_question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_questions/1 or /my_questions/1.json
  def update
    respond_to do |format|
      if @my_question.update(my_question_params)
        format.html { redirect_to @my_question, notice: "My question was successfully updated." }
        format.json { render :show, status: :ok, location: @my_question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_questions/1 or /my_questions/1.json
  def destroy
    @my_question.destroy
    respond_to do |format|
      format.html { redirect_to my_questions_url, notice: "My question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_question
      @my_question = MyQuestion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def my_question_params
      params.require(:my_question).permit(:prompt)
    end
end
