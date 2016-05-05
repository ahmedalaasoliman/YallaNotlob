class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /orders
  # GET /orders.json
  def index
    @ord = Orderuser.where(user_id: current_user.id)
    @allorders = []
    @ord.each do |ordid|
      @order = Order.find(ordid.order_id)
      joined = Orderuser.where(order_id: @order.id,status: 'joined').count
      invited = Orderuser.where(order_id: @order.id).count
      @order.invited = invited
      @order.joined = joined
      @order.save
      @allorders.push(@order)
    end

  end

  def finish
    puts "**********************************************"
    puts params
    order = Order.find(params[:format])
    order.status = "finished"
    order.save
    redirect_to orders_path
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    #puts params
    @items = Item.where(order_id: params[:id])
    @invited = Orderuser.where(order_id: params[:id]).count
    @joined = Orderuser.where(order_id: params[:id],status: 'joined').count
    @invusers = Orderuser.where(order_id: params[:id])
    @jonusers = Orderuser.where(order_id: params[:id],status: 'joined')
    puts @invited
    puts @joined
  end

  # GET /orders/new
  def new
    @order = Order.new
    #global variable to store invited friends. will be used when submitting the new order form in create action
    $order_invited_friends = []
    @followables = Follow.where(follower_id: current_user.id).pluck(:followable_id)

    @followables_array  = []
    @followables.each do |id|
      @email = User.find(id).email
      @followables_array.push(@email)
    end
  end

  def order_ajax_response
    puts "*******************************user**********************************"
    @users_emails = User.all.pluck(:email)
    @followables_ids = Follow.where(:follower_id => current_user.id).pluck(:followable_id)

    respond_to do |format|
      @email = params[:order][:order_for]
      if @users_emails.include? @email
        @user = User.find_by_email(@email)
        if @followables_ids.include? @user.id and !$order_invited_friends.include? @email
          format.html
          format.js
          $order_invited_friends.push(@email)

        #else
        end
      #else
      end


    end
  end

  def order_ajax_response_remove
    respond_to do |format|
      @email = params[:email]
      @id = params[:id]
      format.html
      format.js
      $order_invited_friends.delete(@email)

    end


  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order['user_id']=current_user.id
    @order['status'] = "waiting" 
    respond_to do |format|
      if @order.save
        

         # (@users.uniq - [current_user]).each do |user|
         #   Notification.create(recipient: current_user, actor: current_user, action: "ordered", notifiable: @order , order: @order['id'])
         # end


      

        ($order_invited_friends.uniq - [current_user]).each do |user|
          @userIdX = User.find_by_email(user)
          Notification.create(recipient: @userIdX, actor: current_user, action: "ordered", notifiable: @order , order: @order)
        end

        $order_invited_friends.each do |o|
            # saving into orders_users table
            @user = User.find_by_email(o)
            Orderuser.create(:order_id => @order.id, :user_id => @user.id)
          end


        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:order_for, :order_from, :menu_image, :status, :user_id, :avatar)
    end
end
