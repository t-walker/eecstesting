class UsertestsController < ApplicationController
  before_action :set_usertest, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @usertests = Usertest.all
  end

  def show
    @usertest = Usertest.find(params[:id])
  end

  def new
    @usertest = Usertest.new
    @questions = Question.all
    @usertest_responses = @usertest.responses.build
  end

  def create
    @usertest = Usertest.new(usertest_params)
    respond_to do |format|
      if @usertest.save
        format.html { redirect_to @usertest, notice: 'Usertest was successfully created.' }
        format.json { render :show, status: :created, location: @usertest }
      else
        format.html { render :new }
        format.json { render json: @usertest.errors, status: :unprocessable_entity }
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
  def set_usertest
    @usertest = Usertest.find(params[:id])
  end

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end

  def usertest_params
    params.require(:usertest).permit(:user_id, :responses_attributes => [:response_data, :question_id])
  end
end
