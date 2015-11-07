class TestversionsController < ApplicationController
  load_and_authorize_resource
  before_action :set_testversion, only: [:show, :edit, :update, :destroy]

  def show
    @testversion = Testversion.find(params[:id])
  end

  def new
    @testversion = Testversion.new
    @questions = Question.all
    @options = options_for_open
  end

  def edit
    @testversion = Testversion.find(params[:id])
    @testversion.startdate = @testversion.startdate.strftime("%m/%d/%Y")
    @testversion.enddate = @testversion.enddate.strftime("%m/%d/%Y")
    @options = options_for_open
    @questions = Question.all
  end

  def create
    @testversion = Testversion.new(testversion_params)
    @testversion.startdate = Date.strptime(testversion_params[:startdate], "%m/%d/%Y")
    @testversion.enddate = Date.strptime(testversion_params[:enddate], "%m/%d/%Y")
    respond_to do |format|
      if @testversion.save
        format.html { redirect_to usertests_url, notice: 'Test Version was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    x = testversion_params
    x[:startdate] = Date.strptime(x[:startdate], "%m/%d/%Y").strftime("%d/%m/%Y")
    puts x[:startdate]
    x[:enddate] = Date.strptime(x[:enddate], "%m/%d/%Y").strftime("%d/%m/%Y")
    puts x[:enddate]
    respond_to do |format|
      if @testversion.update(x)
        format.html { redirect_to usertests_url, notice: 'Test Version was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def options_for_open
    [
      ['True','1'],
      ['False','0']
    ]
  end

private
  def set_testversion
    @testversion = Testversion.find(params[:id])
  end
  def testversion_params
    params.require(:testversion).permit(:title, :startdate, :enddate, :isopen, { question_ids:[] }).merge(user_id: current_user.id)
  end
end
