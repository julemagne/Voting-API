# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Candidate.create!(name: "Julie", hometown: "Apex", district: "abd123", party: "HTT")
Candidate.create!(name: "Angela", hometown: "Apex", district: "abd123", party: "HTT")

Voter.create!(name: "David", party: "HTT", token: "dcf93c101c14a7c7c0cdbe1be9ae0b09")
Voter.create!(name: "Michelle", party: "HTT", token: "743e5a55dfd9365307b0c63167d99c95")
Voter.create!(name: "Marie", party: "HTT", token: "78ffd6ec14cf7a78365fedd3fcb29f96")

Vote.create!(voter: "David", candidate: "Julie")
Vote.create!(voter_id: "2", candidate_id: "1")
