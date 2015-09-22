require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  def test_candidate_validations
    msdavid = Candidate.new()
    refute msdavid.save
    msdavid = Candidate.new(name: "Ms. David", hometown: "Dexter", district: "ABC123", party: "HTT")
    assert msdavid.save
    assert_equal "Ms. David", msdavid.name
  end

  def test_candidate_associations
    msdavid = Candidate.new(name: "Ms. David", hometown: "Dexter", district: "ABC123", party: "HTT")
    msdavid.save
    vote = Vote.new()
    vote.save
    msdavid.votes << vote
    assert msdavid.reload.votes.include?(vote)
  end
end
