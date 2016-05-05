class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    puts params
    @item = Item.new
    @item.user_id = current_user.id
    user = User.find_by(id: current_user.id )
    @item.person = user.email
    @item.item_name = params[:item]
    @item.amount = params[:amount]
    @item.price = params[:price]
    @item.comment = params[:comment]
    @item.order_id = params[:ordid]
    @item.save
    render json: @item
   # @item = Item.new(item_params)
    #@item['user_id']=current_user.id
    #@order = Order.find(params[:order_id])
    #@item = @order.items.create(item_params)
    #respond_to do |format|
     # if @item.save
      #  format.html { redirect_to @item, notice: 'Item was successfully created.' }
       # format.json { render :show, status: :created, location: @item }
      #else
       # format.html { render :new }
        #format.json { render json: @item.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item  = Item.find(params[:id])
    @item.destroy
    render json: @item
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:item_name, :amount, :price, :comment, :user_id, :order_id)
    end
end
