require 'test_helper'
require 'byebug'

class VoterTest < ActiveSupport::TestCase
  def test_voter_validations
    voter = Voter.new()
    refute voter.save
    julie = Voter.new(name: "Julie", party: "HTT")
    assert julie.save
    assert_equal "Julie", julie.reload.name
  end

  def test_voter_associations
    julie = Voter.new(name: "Julie", party: "HTT")
    julie.save
    vote = Vote.new(voter_id: 1, candidate_id: 1)
    vote.save
    julie.votes << vote
    assert julie.reload.votes.include?(vote)
  end
end
