class DemoController < ApplicationController
  def default
    @map = Map.new
  end
end
