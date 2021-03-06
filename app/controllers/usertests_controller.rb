class UsertestsController < ApplicationController
  load_and_authorize_resource
  before_action :set_usertest, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @usertests = Usertest.last(5)
    @testversions = Testversion.order('testversions.isopen DESC').last(5)
    respond_to do |format|
      format.html
      format.csv { send_data @usertests.to_csv}
    end
  end

  def showtest
    @student = User.find_by_studentid(params[:studentid])
    puts "\n\n\n\n" + params[:studentid] + "\n\n\n"
    @usertest = @student.usertests.first
    @responses = @usertest.responses
    respond_to do |format|
      format.html { render partial: "showtest"}
    end
  end

  def show
    @usertest = Usertest.find(params[:id])
    @student = User.find_by_id(@usertest.user_id)
    @responses = @usertest.responses
  end

  def new
    @usertest = Usertest.new
    @usertest.testversion = Testversion.current
    @testversion = @usertest.testversion
    @usertest_responses = @usertest.responses.build
  end

  def create
    @usertest = Usertest.new(usertest_params)
    @usertest.testversion = Testversion.current
    grade_test(@usertest)
    respond_to do |format|
      if @usertest.save
        format.html { redirect_to root_url, notice: 'Your test was submitted. Thank you.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @usertest = Usertest.find(params[:id])
  end

  def update
    respond_to do |format|
      if @Usertest.update(usertest_params)
        format.html { redirect_to @usertest, notice: 'Usertest was successfully updated.' }
        format.json { render :show, status: :ok, location: @usertest }
      else
        format.html { render :edit }
        format.json { render json: @usertest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @usertest.destroy
    respond_to do |format|
      format.html { redirect_to usertests_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

  def grade_test(user_test)
    @usertest = user_test
    correct = 0
    @usertest.responses.each do |r|
      @question = Question.find_by_id(r.question_id)
      if r.response_data.strip.downcase == @question.correct.strip.downcase
        r.correct = true
        correct += 1
      elsif @question.question_type == "longans"
        correct += 1
      else
        r.correct = false
      end
    end

    @usertest.score = ((correct.to_f / (@usertest.responses.size).to_f) * 100)
  end

  def set_usertest
    @usertest = Usertest.find(params[:id])
  end

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end

  def usertest_params
    params.require(:usertest).permit(:testversion_id, :responses_attributes => [:response_data, :question_id]).merge(user_id: current_user.id)
  end
end
