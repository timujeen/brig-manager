class JobsController < ApplicationController
  def index
    @jobs = Job.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs.tokens(params[:q]) }
    end
  end
end
