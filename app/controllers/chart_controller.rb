class ChartController < ApplicationController
  def scatterplot
    `scripts/buildScatterplotData.sh`
  end
end

