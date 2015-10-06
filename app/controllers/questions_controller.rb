class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question.new(question_params)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def set_question
    @question = Question.find(params[:id])
  end

  def set_user
    if user_signed_in?
      @user = current_user
    end 
  end

  def question_params
    params.require(:question).permit(:prompt, :possible1, :possible2, :possible3, :possible4, :correct)
  end
end
