class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @rooms = current_user.rooms
    # OR @rooms = Rooms.all
  end

  def show

  end

  def new
    @room = current_user.rooms.build
    # Returns a new object of the associated type that has been instantiated with attributes and linked to this object through a foreign key, but has not yet been saved.
    # This is the object that is created with .build, the current_user is a DEVISE method which is any user signed in and it attaches that user id to the foreign key in the room object which is then assigned to @room
    # first.rooms.build
    #<Room id: nil, home_type: nil, room_type: nil, accomomodate: nil, bed_room: nil, bath_room: nil, listing_name: nil, summar: nil, address: nil, is_tv: nil, is_kitchen: nil, is_air: nil, is_heating: nil, is_internet: nil, price: nil, active: nil, user_id: 11, created_at: nil, updated_at: nil>

  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      redirect_to @room, notice: "Saved..."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: "Updated..."
    else
      render :edit
    end
  end

  private

    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summar, :address, :is_kitchen, :is_heating, :is_air, :is_air, :is_internet, :price, :active)
    end

end
