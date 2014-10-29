# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.destroy_all

Category.create name: "Partner"
Category.create name: "Family"
Category.create name: "Friends"
Category.create name: "Work"
Category.create name: "Pets"
Category.create name: "Others"

