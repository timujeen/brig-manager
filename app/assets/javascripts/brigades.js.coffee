# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#brigade_job_tokens').tokenInput("/jobs.json", 
  	theme: 'facebook',
  	prePopulate: $('#brigade_job_tokens').data('load'))
  $('#job_ids').chosen()
  $('#country_id').chosen()
  $('#brigade_country_id').chosen()

