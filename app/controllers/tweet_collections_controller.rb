class TweetCollectionsController < ApplicationController
  before_action :set_tweet_collection, only: [:show, :edit, :update, :destroy]

  # GET /tweet_collections
  # GET /tweet_collections.json
  def index
    @tweet_collections = TweetCollection.all
  end

  # GET /tweet_collections/1
  # GET /tweet_collections/1.json
  def show
  end

  # GET /tweet_collections/new
  def new
    @tweet_collection = TweetCollection.new
  end

  # GET /tweet_collections/1/edit
  def edit
  end

  # POST /tweet_collections
  # POST /tweet_collections.json
  def create
    @tweet_collection = TweetCollection.new(tweet_collection_params)

    respond_to do |format|
      if @tweet_collection.save
        format.html { redirect_to @tweet_collection, notice: 'Tweet collection was successfully created.' }
        format.json { render :show, status: :created, location: @tweet_collection }
      else
        format.html { render :new }
        format.json { render json: @tweet_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweet_collections/1
  # PATCH/PUT /tweet_collections/1.json
  def update
    respond_to do |format|
      if @tweet_collection.update(tweet_collection_params)
        format.html { redirect_to @tweet_collection, notice: 'Tweet collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet_collection }
      else
        format.html { render :edit }
        format.json { render json: @tweet_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweet_collections/1
  # DELETE /tweet_collections/1.json
  def destroy
    @tweet_collection.destroy
    respond_to do |format|
      format.html { redirect_to tweet_collections_url, notice: 'Tweet collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet_collection
      @tweet_collection = TweetCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_collection_params
      params[:tweet_collection]
    end
end
