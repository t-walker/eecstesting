class UserTestsController < ApplicationController
  before_action :set_test, only: [:show, :create, :edit, :update, :destroy]
  before_action :set_user

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
    @questions = Question.all
  end

  def create
    @test.new(test_params)
  end

  def edit
    @test = test.find(params[:id])
  end

  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def set_test
    @test = test.find(params[:id])
  end

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end

  def test_params
    params.require(:test).permit()
  end
end
