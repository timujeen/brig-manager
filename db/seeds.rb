#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Country.delete_all
Country.create!(title: 'Россия')
Country.create!(title: 'Китай')
Country.create!(title: 'Германия')

Filtering.delete_all
Filtering.create!(enabled: false, country_id: nil)
