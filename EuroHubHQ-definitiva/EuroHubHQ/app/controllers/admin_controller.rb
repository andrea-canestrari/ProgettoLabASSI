class AdminController < ApplicationController
    layout 'admin'
    before_action :authenticate_admin!
  
    def index
      @orders = Order.where(completed: false).order(created_at: :desc).take(5)
      @stats = { 
        sales: Order.where(created_at: Time.now.midnight..Time.now).count,
        revenue: Order.where(created_at: Time.now.midnight..Time.now).sum(:total).round(),
        average_sale: Order.where(created_at: Time.parse("Jan 1 2024 00:00")..Time.now).average(:total).round(),
        sales_per_day: OrderProduct.joins(:order).where(orders: { created_at: Time.now.midnight..Time.now }).average(:quantity)
      }
      @orders_by_day = Order.where('created_at > ?', Time.now - 7.days).order(:created_at)
      @orders_by_day = @orders_by_day.group_by { |order| order.created_at.to_date }
      @income_by_day = @orders_by_day.map { |day, orders| [day.strftime("%A"), orders.sum(&:total)] }
      if @income_by_day.count < 7
        week_days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
  
        data_hash = @income_by_day.to_h
        current_day = Date.today.strftime("%A")
        current_day_index = week_days.index(current_day)
        next_day_index = (current_day_index + 1) % week_days.length
  
        ordered_days_with_current_last = week_days[next_day_index..-1] + week_days[0...next_day_index]
  
        complete_ordered_array_with_current_last = ordered_days_with_current_last.map{ |day| [day, data_hash.fetch(day, 0)] }
  
        @income_by_day = complete_ordered_array_with_current_last 
      end
    end
  end