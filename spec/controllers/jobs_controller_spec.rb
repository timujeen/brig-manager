require 'spec_helper'

describe JobsController do

  describe "GET index" do
    it "assigns all jobs as @jobs" do
      job = Job.create!(name: "MyJob")
      get :index
      assigns(:jobs).should eq([job])
    end
  end

  describe "DELETE destroy" do
  	it "destroys a requested job" do
      job = Job.create!(name: "MyJob")
      expect {
        delete :destroy, {:id => job.to_param}
      }.to change(Job, :count).by(-1)
    end

    it "destroys a brigades with only the job" do
      job = Job.create!(name: "MyJob")
      brigade = Brigade.create!(
    	"title" => "MyString",
      	"count_of_workers" => 9,
      	"price" => 99.9,
      	"country_id" => Country.find_or_create_by_title("Russia").id,
      	"job_ids" => [job.id])
      expect {
        delete :destroy, {:id => job.to_param}
      }.to change(Brigade, :count).by(-1)
	end
  end
end
