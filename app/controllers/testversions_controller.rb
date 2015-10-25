class TestversionsController < ApplicationController
def index
  @Testversions = Testversions.all
end
end
