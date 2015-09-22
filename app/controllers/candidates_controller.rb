class CandidatesController < ApplicationController
  def index
    render json: Candidate.all.to_json
  end
end
