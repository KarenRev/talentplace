class TalentsController < ApplicationController
  before_action :set_talent, only: %i[show edit update]

  def index
    if params[:query].present?
      sql_query = "talents.name ILIKE :query OR address ILIKE :query OR genres.name ILIKE :query"
      @talents = Talent.joins(:genres).where(sql_query, query: "%#{params[:query]}%").distinct
    else
      @talents = Talent.all
    end
  end

  def show
  end

  def edit
    talent_genres = Genre.where.not(id: [@talent.genres.pluck(:id)]).map do |genre|
      TalentGenre.new(genre: genre, talent: current_talent)
    end
    @all_genres = talent_genres + @talent.talent_genres
    # @talent_genres = @talent.genres
  end

  def update
    @talent.talent_genres.destroy_all
    genre_ids = params[:talent][:genre_ids].split(',').map(&:to_i)
    genre_ids.each do |genre_id|
      TalentGenre.create!(talent: current_talent, genre: Genre.find_by(id: genre_id))
    end
    @talent.update(talent_params)
    redirect_to talent_path(@talent)
  end
end

private

def talent_params
  params.require(:talent).permit(:name, :description, :address, :youtube_link, :instagram_link, :spotify_link, :price, :photo, :address)
end

def set_talent
  begin
    @talent = Talent.find(params[:id])
  rescue
    p "talent not found"
  end
end
