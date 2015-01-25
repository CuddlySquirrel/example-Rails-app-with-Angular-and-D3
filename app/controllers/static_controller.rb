class StaticController < ActionController::Base
  def cereal
    respond_to do |format|
      format.csv
    end
  end
end

