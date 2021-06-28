class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :update, :destroy]

  # GET /decks
  def index
    @decks = Deck.all

    render json: @decks
  end

  # GET /decks/1
  def show
    render json: @deck
  end

  # POST /decks
  def create
    @deck = Deck.new(deck_params)

    if @deck.save
      render json: @deck, status: :created, location: @deck
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /decks/1
  def update
    if @deck.update(deck_params)
      render json: @deck
    else
      render json: @deck.errors, status: :unprocessable_entity
    end
  end

  # DELETE /decks/1
  def destroy
    @deck.destroy
  end

  def high_low
    sorted_decks = Deck.all.sort_by{|d| d.price }
    sorted_decks = sorted_decks.reverse
    render json: sorted_decks
  end 

  def low_high
    sorted_decks = Deck.all.sort_by{|d| d.price }
    render json: sorted_decks
  end 

  def large_small
    sorted_decks = Deck.all.sort_by{|d| d.size }
    sorted_decks = sorted_decks.reverse
    render json: sorted_decks
  end 

  def small_large
    sorted_decks = Deck.all.sort_by{|d| d.size }
    render json: sorted_decks
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deck_params
      params.require(:deck).permit(:name, :brand, :price, :size, :foreign_key, :cart_id)
    end
end
