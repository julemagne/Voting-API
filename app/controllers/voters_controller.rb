class VotersController < ApplicationController
  before_filter :restrict_access, except: :create

  # def index
  #   render json: Voter.all.to_json
  # end

  def show
      render json: Voter.find_by(token: params[:token])
    # ActiveRecord find method only takes id
    # You can type in http://localhost:3000/candidates/show?id=2 for Candidate 2
  end

  def destroy
    id = params[:id]
    Voter.find(id).destroy
    render json: Voter.all.to_json
  end

  def create
    c = Voter.new(name: params[:name], party: params[:party], token: ApiKey.create.token)
    if c.save
      render json: c.to_json
    else
      render json: c.errors
    end
  end

  def update
    v = Voter.find_by_token(params[:token])
    v.update(name: params[:name], party: params[:party])
    render json: v.to_json
  end

  private
    def restrict_access
      api_key = ApiKey.find_by_token(params[:token])
      head :unauthorized unless api_key
    end
    # def restrict_access
    #   authenticate_or_request_with_http_token do |token, options|
    #     ApiKey.exists?(token: token)
    #   end
    # end
end
