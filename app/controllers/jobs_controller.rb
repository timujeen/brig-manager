class JobsController < ApplicationController
  def index
  	session[:filter] = nil
    @jobs = Job.ordered_by_count_of_brigades

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs.tokens(params[:q]) }
    end
  end

  def destroy
    @job = Job.find(params[:id])
    #find brigades with just a job and delete
    ids_to_delete = Brigade.all.select{|b| ((b.jobs.size == 1) && (b.job_ids == [@job.id]))}.map(&:id)
    Brigade.delete(ids_to_delete)
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_path }
      format.json { head :no_content }
    end
  end  	
  	
end
