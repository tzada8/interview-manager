class InterviewsController < ApplicationController
  before_action :set_interview, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: %i[ show edit update destroy ]

  # GET /interviews or /interviews.json
  def index
    @interviews = current_user.sort_interviews
  end

  # GET /interviews/1 or /interviews/1.json
  def show
  end

  # GET /interviews/new
  def new
    @interview = current_user.interviews.build
  end

  # GET /interviews/1/edit
  def edit
  end

  # POST /interviews or /interviews.json
  def create
    @interview = current_user.interviews.build(interview_params)

    respond_to do |format|
      if @interview.save
        format.html { redirect_to @interview, notice: "Interview was successfully created." }
        format.json { render :show, status: :created, location: @interview }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interviews/1 or /interviews/1.json
  def update
    respond_to do |format|
      if @interview.update(interview_params)
        format.html { redirect_to @interview, notice: "Interview was successfully updated." }
        format.json { render :show, status: :ok, location: @interview }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @interview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interviews/1 or /interviews/1.json
  def destroy
    @interview.destroy
    respond_to do |format|
      format.html { redirect_to interviews_url, notice: "Interview was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @interview = current_user.interviews.find_by(id: params[:id])
    redirect_to interviews_path, notice: "Not Authorized to Access This Interview" if @interview.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview
      @interview = Interview.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def interview_params
      params.require(:interview).permit(:position, :company, :date, :duration, :interviewer, :industry, :user_id)
    end
end
