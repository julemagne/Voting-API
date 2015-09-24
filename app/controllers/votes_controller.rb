class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def show
    id = params[:id]
    render json: Vote.find(id).to_json
    # ActiveRecord find method only takes id
    # You can type in http://localhost:3000/candidates/show?id=2 for Candidate 2
  end

  def destroy
    id = params[:id]
    Vote.find(id).destroy
    render json: Vote.all.to_json
  end

  def create
    c = Vote.new(voter_id: params[:voter_id], candidate_id: params[:candidate_id])
    if c.save
      render json: c.to_json
    else
      render json: c.errors
    end
  end

end
