class MissionsController < ApplicationController
  include CurrentUserConcern

  def homemissions
    @mission = Mission.where('freelancer_id IS NULL')
    render json: @mission, include: %i[requests category mission_languages languages client]
  end

  def index
    @missions = Mission.all
    render json: @missions, include: %i[category mission_languages languages client freelancer]
  end

  def create
    @mission = Mission.new(post_params)
    ids = []
    if @mission.save

      params[:language_id].split(',').each do |lang_id|
        ids.push(lang_id.to_i)
        @missionLanguages = MissionLanguage.create!(language_id: lang_id.to_i, mission_id: @mission.id)
      end

      @missionlanguages = MissionLanguage.where(language_id: ids, mission_id: @mission.id)

      render json: {
        mission: @mission,
        missionlanguages: @missionlanguages
      }, statut: :created, location: @mission

    else
      render json: @mission.errors, statut: :unprocessable_entity
    end
  end

  def show
    @mission = Mission.find(params[:id])
    render json: @mission
  end

  def update
    @ids = JSON.parse(params[:language_id], object_class: OpenStruct).pluck(:id).uniq
    @mission = Mission.find(params[:id])
		byebug
    if @mission.update(post_params2)
			MissionLanguage.where(mission_id: @mission.id).delete_all

			@ids.each do |lang_id|
				@missionLanguages = MissionLanguage.create!(language_id: lang_id, mission_id: @mission.id)
			end


      #@missionlanguages = MissionLanguage.where(language_id: @ids, mission_id: @mission.id)

      render json: {
        mission: @mission,
        missionlanguages: @missionlanguages
      }, statut: :created, location: @mission

    else
      render json: @mission.errors, statut: :unprocessable_entity
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    #  @missionlangauge = MissionLanguage.find_by(mission_id: @mission.id)

    if @mission.freelancer_id.nil?

      @mission.destroy
      #       @missionlangauge.destroy
      render json: { status: 200 }
    else
      render json: { status: 401 }
    end
  end
  # les filtres des pages home

  def getmissionbylanguage
    ids = []
    params[:language_id].split(',').each do |lang_id|
      ids.push(lang_id.to_i)
    end

    @missions = MissionLanguage.where(language_id: ids.uniq)
    @missions = @missions.flat_map(&:mission)
    # @missions=  @mission_languages.flat_map{|ml| ml.mission if ids.uniq.to_s.include?(ml.mission.languages.pluck(:id).to_s) && ml.mission !=nil}
    render json: @missions.uniq, include: %i[category languages]
  end

  def getmissionbycategory
    @missions = Mission.where(category_id: params[:category_id])
    render json: @missions, include: %i[category mission_languages languages client]
  end

  def getmissionbybudget
    @missions = Mission.where('budget <= ?', params[:budget]).order('budget DESC')
    render json: @missions, include: %i[category mission_languages languages client]
  end

  def getclientmission
    @missions = Mission.where(client_id: params[:client_id])
    render json: @missions, include: %i[category mission_languages languages]
  end

  def getendedmissionbyclient
    # ids = []
    @mission = Mission.where('completed = ?', status = true).where(client_id: params[:client_id])
    # @status = Mission.where("completed = ?" , status = true )
    render json: @mission, include: %i[freelancer client]
  end

  def getendedmissionbyfreelancer
    @mission = Mission.where('completed = ?', status = true).where(freelancer_id: params[:freelancer_id])
    render json: @mission, include: %i[client freelancer]
  end

  private

  def post_params
    params.permit(:title, :description, :duration, :beginingDate, :budget, :client_id, :category_id,
                  mission_languages: [:language_id])
  end

  def post_params2
    # lazm tbaath kol shy fl update
    params.permit(:title, :description, :duration, :budget, :beginingDate, :category_id,
                  mission_languages: [:language_id])
  end

  def set_post
    @mission = Mission.find(params[:id])
  end
end
