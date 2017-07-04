class User::ProfilesController < ApplicationController

  def index
    if current_user.profile.present?
      @profile = current_user.profile
    else
      redirect_to new_user_profile_path
    end
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      if params[:form_submitted].present? and params[:form_submitted] == "Save"
        redirect_to user_profiles_path
      elsif params[:image].present? and params[:image] == "user_form"        
        redirect_to edit_user_profile_path(@profile)
      else
        redirect_to user_profiles_path
      end
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      if params[:form_submitted].present? and params[:form_submitted] == "Save"
        redirect_to user_profiles_path
      else
        redirect_to edit_user_profile_path(@profile)
      end
    else
      render 'edit'
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    if params[:img].present? and params[:img] == "image_1"
      @profile.image = nil
      @profile.save
    end
    redirect_to user_profiles_path
  end


  private

  def profile_params
    params.require(:profile).permit!
  end
end
