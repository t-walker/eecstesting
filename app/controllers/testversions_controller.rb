class TestversionsController < ApplicationController
  def show
    @testversion = Testversion.find(params[:id])
  end

  def new
    @testversion = Testversion.new
  end

  def create
    @testversion = Testversion.new(testversion_params)

    respond_to do |format|
      if @testversion.save
        format.html { redirect_to usertests_url, notice: 'testversion was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

private
  def testversion_params
    params.require(:testversion).permit(:title, :startdate, :enddate, :isopen).merge(user_id: current_user.id)
  end
end
