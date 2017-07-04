class VideoRoomsController < ApplicationController
  require "opentok"
  before_action :config_opentok, :except => [:index]

  def index
    @rooms = VideoRoom.where(:public => true).order("created_at DESC")
    @new_room = VideoRoom.new
  end

  def create
    # session = @opentok.create_session request.remote_addr
    session = @opentok.create_session

    @new_room = VideoRoom.new(video_room_params)
    @new_room.sessionId = session.session_id
    @new_room.user_id = current_user.id

    respond_to do |format|
      if @new_room.save
        format.html { redirect_to("/party/"+@new_room.id.to_s) }
      else
        format.html { render :controller => 'video_rooms', :action => "index" }
      end
    end
  end

  def party
    @room = VideoRoom.find(params[:id])
    @tok_token = @opentok.generate_token @room.sessionId 
  end

  private

  def video_room_params
    params.require(:video_room).permit!
  end

  def config_opentok
    if @opentok.nil?
      tries = 3
      begin
        @opentok = OpenTok::OpenTok.new "45907862", "a95f8abe0dff04f917184114c6f4f43ae8957152"
        logger.debug "opentok connected."
      rescue Errno::ETIMEDOUT => e
        log.error e 
        tries -= 1
        if tries > 0
          logger.debug "retrying opentok.new..."
        retry 
        else
          logger.debug "opentok.new timed out..."
          puts "ERROR: #{e.message}" 
        end
      end
    end
  end

  # ## Generate a Token from just a session_id (fetched from a database)
  # token = opentok.generate_token session_id

  # ## Generate a Token by calling the method on the Session (returned from createSession)
  # token = session.generate_token

  # ## Set some options in a token
  # token = session.generate_token({
  #     :role        => :moderator,
  #     :expire_time => Time.now.to_i+(7 * 24 * 60 * 60), # in one week
  #     :data        => 'name=Johnny'
  # });

end
