class ChartController < ApplicationController
  def scatterplotExample
    `scripts/buildScatterplotData.sh`
  end
end

