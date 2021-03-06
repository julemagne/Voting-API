class CandidatesController < ApplicationController
  def index
    render json: Candidate.all.to_json
  end

  def show
    id = params[:id]
    render json: Candidate.find(id).to_json
    # ActiveRecord find method only takes id
    # You can type in http://localhost:3000/candidates/show?id=2 for Candidate 2
  end

  def destroy
    id = params[:id]
    Candidate.find(id).destroy
    render json: Candidate.all.to_json
  end

  def create
    c = Candidate.new(name: params[:name], hometown: params[:hometown], district: params[:district], party: params[:party])
    if c.save
      render json: c.to_json
    else
      render json: c.errors
    end
  end
end
