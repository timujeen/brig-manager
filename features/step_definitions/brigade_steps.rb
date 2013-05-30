Given(/^I have no brigades$/) do
  Brigade.delete_all
end

Given(/^I have jobs titled (.+)$/) do |jobs|
  Job.delete_all
  jobs.split(', ').each {|j| Job.create!(name: j.strip)}
end

Given(/^I am on the (.+)$/) do |path|
  visit path_to(path)
end

When(/^I follow "(.*?)"$/) do |link|
  click_link(link)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in(field, with: value)
end

When(/^I select "(.*?)" from "(.*?)"$/) do |value, field|
  select(value, from: field)
end

When(/^I press "(.*?)"$/) do |button|
  click_button(button)
end

Then(/^I should be redirected to the (.+)$/) do |path|
  current_path.should == path_to(path)
end

Then(/^I should see "(.*?)"$/) do |arg|
  page.should have_content(arg)
end

Then(/^I should have (\d+) brigade$/) do |arg|
  arg == Brigade.count
end

Then(/^I should have (\d+) jobs$/) do |arg|
  arg == Job.count
end

Given(/^I have brigade titled (.+) with jobs titled (.+)$/) do |name, job_names|
  brigade = Brigade.new(title: name, count_of_workers: 10, price: 100, 
                        country_id: Country.where(title: "Russia").first.id)
  job_names.split(', ').each do |j|
    brigade.jobs << Job.where(name: j.strip)
  end
  brigade.save
end

Then(/^I should not see "(.*?)"$/) do |arg|
  page.should_not have_content(arg)
end

Given(/^I have countries titled (.+)$/) do |countries|
  Country.delete_all
  countries.split(', ').each {|c| Country.create!(title: c.strip)}
end

Given(/^I have brigade titled (.+) with country "(.*?)" and with jobs "(.*?)"$/) do |name, country, job_names|
  brigade = Brigade.new(title: name, count_of_workers: 10, price: 100, 
                        country_id: Country.where(title: country).first.id)
  job_names.split(', ').each do |j|
    brigade.jobs << Job.where(name: j.strip)
  end
  brigade.save
end