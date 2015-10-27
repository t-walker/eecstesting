class TestversionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_testversion, only: [:show, :edit, :update, :destroy]

  def show
    @testversion = Testversion.find(params[:id])
  end

  def new
    @testversion = Testversion.new
    @questions = Question.all
  end

  def edit
    @testversion = Testversion.find(params[:id])
    @questions = Question.all
  end

  def create
    @testversion = Testversion.new(testversion_params)
    @testversion.startdate = Date.parse(@testversion.startdate.to_s)
    @testversion.enddate = Date.parse(@testversion.enddate.to_s)
    respond_to do |format|
      if @testversion.save
        format.html { redirect_to usertests_url, notice: 'testversion was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @testversion.update(testversion_params)
        format.html { redirect_to usertests_url, notice: 'testversion was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

private
  def set_testversion
    @testversion = Testversion.find(params[:id])
  end
  def testversion_params
    params.require(:testversion).permit(:title, :startdate, :enddate, :isopen, { question_ids:[] }).merge(user_id: current_user.id)
  end
end
