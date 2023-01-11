class QueriesController < ApplicationController
  def index
    @queries = Query.all
  end

  def new
  end

  def create
    prompt = params["query"]["prompt"]
    query = Query.new(:prompt => prompt)
    query['completion'] = query.askGPT

    if query.save
      redirect_to root_path
    else
      redirect_to ask_path
    end
  end

  def destroy
    @query = Query.find(params[:id])
    
    if @query.favourite
      flash.alert = "Favourited queries cannot be deleted."
    else 
      @query.destroy
    end
    
    redirect_to root_path
  end

  def favourite
    @query = Query.find(params[:id])

    @query.favourite = !@query.favourite
    @query.save!

    redirect_to root_path
  end
end
