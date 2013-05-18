class CreateBrigadesJobsJoin < ActiveRecord::Migration
  def up
  	create_table :brigades_jobs, id: false do |t|
  		t.integer :brigade_id
  		t.integer :job_id  		
  	end
  end

  def down
  	drop_table :brigades_jobs
  end
end
