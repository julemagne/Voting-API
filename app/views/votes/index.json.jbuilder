json.votes @votes do |vote|
  json.candidate_id vote.candidate_id
  json.voter_id vote.voter_id
end
