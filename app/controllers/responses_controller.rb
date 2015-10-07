class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  def index
    @responses = response.all
  end

  def show
    @response = response.find(params[:id])
  end

  def new
    @response = response.new
  end

  def create
    respond_to do |format|
      if @response.save
        format.html { redirect_to @response, notice: 'response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @response = response.find(params[:id])
  end

  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to responses_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  def set_response
    @response = response.find(params[:id])
  end

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end

  def response_params
    params.require(:response).permit(:response_data, :question_id)
  end
end
