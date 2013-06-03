#encoding: utf-8
class BrigadesController < ApplicationController
  # GET /brigades
  # GET /brigades.json
  def index

    turn_filter "off" if params[:filtering] == "disable" || session[:filter] == nil
    turn_filter "on" if params[:filtering] == "enable" || params[:commit] || params[:id_from_jobs]

    @brigades = Brigade.filtered_and_ordered_by_params(
      session[:filter][:country_id],
      session[:filter][:job_ids],
      params[:order])

    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @brigades }
    end
  end

  # GET /brigades/new
  # GET /brigades/new.json
  def new
    session[:filter] = nil
    @brigade = Brigade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brigade }
    end
  end

  # GET /brigades/1/edit
  def edit
    @brigade = Brigade.find(params[:id])
  end

  # POST /brigades
  # POST /brigades.json
  def create
    @brigade = Brigade.new(params[:brigade])

    respond_to do |format|
      if @brigade.save
        format.html { redirect_to brigades_url, notice: 'Бригада успешно создана.' }
        format.json { render json: @brigade, status: :created, location: @brigade }
      else
        format.html { render action: "new" }
        format.json { render json: @brigade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brigades/1
  # PUT /brigades/1.json
  def update
    @brigade = Brigade.find(params[:id])

    respond_to do |format|
      if @brigade.update_attributes(params[:brigade])
        format.html { redirect_to brigades_url, notice: 'Бригада успешно обновлена.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brigade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brigades/1
  # DELETE /brigades/1.json
  def destroy
    @brigade = Brigade.find(params[:id])
    @brigade.destroy

    respond_to do |format|
      format.html { redirect_to brigades_url }
      format.json { head :no_content }
    end
  end

  private

  def turn_filter(option)
    default_session = {
      enabled: false,
      country_id: 0,
      job_ids: [],
    }

    session[:filter] ||= default_session

    if option == "on"
      session[:filter][:enabled] = true
      #if parameter exists then save it as integer, else save 0
      session[:filter][:country_id] = params[:country_id].present? ? params[:country_id].to_i : 0
      #if parameters exist then save it as array of integer (removing empty values), else save []
      #if parameter comes from jobs page then save it array of one
      session[:filter][:job_ids] = if params[:id_from_jobs].present?
        [params[:id_from_jobs].to_i]
      elsif params[:job_ids].present?        
        params[:job_ids].reject(&:empty?).map(&:to_i)
      else
        []
      end
    end
    if option == "off"
      session[:filter] = default_session
    end
  end

end
