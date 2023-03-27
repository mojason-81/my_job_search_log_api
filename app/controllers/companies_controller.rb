class CompaniesController < ApplicationController
  def show
    @company = Company.includes(:contacts).find(params[:id])
    render json: @company, include: [:contacts]
  end
end
