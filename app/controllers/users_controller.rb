class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search]

  def index
    if user_signed_in?
       @users = User.all
    else
      redirect_to root_path
    end
  end

  def show
      @user = User.find(params[:id])
      @currentUserEntry=Entry.where(user_id: current_user.id)
      @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
  

  def search
    @users = User.search(params[:keyword])
  end
end






