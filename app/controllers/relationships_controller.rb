class RelationshipsController < ApplicationController
  before_filter: authenticate_patient! || authenticate_doctor!

  def index
    index_instance_vars
  end

  def new
    @relationship = Relationship.new
  end

  def create
    @relationship = Relationship.new(relationship_params)
    if @relationship.save
      redirect_to relationships_url
    else
      render :index
    end
  end

  def accept
    @relationship.status = 'accepted'
    if @relationship.save
      redirect_to relationships_url
    else
      render :index
    end
  end

end
