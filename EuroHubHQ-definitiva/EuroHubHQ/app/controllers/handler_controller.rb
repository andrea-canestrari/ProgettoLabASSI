class HandlerController < ApplicationController
  before_action :authenticate_handler!
  def index
    @orders = Order.where(completed: false).where(email: current_handler.email).order(created_at: :desc).take(10)
    @stats = { 
        purchases: Order.where(created_at: Time.parse("Jan 1 2024 00:00")..Time.now).where(email: current_handler.email).count,
        expense: Order.where(created_at: Time.parse("Jan 1 2024 00:00")..Time.now).where(email: current_handler.email).sum(:total).round(),
        average_purchases: Order.where(created_at: Time.now.midnight..Time.now).where(email: current_handler.email).average(:total),
        purchases_per_day: OrderProduct.joins(:order).where(orders: { created_at: Time.now.midnight..Time.now }).average(:quantity)
      }
      @orders_by_day = Order.where(email: current_handler.email).where('created_at > ?', Time.now - 7.days).order(:created_at)
      @orders_by_day = @orders_by_day.group_by { |order| order.created_at.to_date }
      @expense_by_day = @orders_by_day.map { |day, orders| [day.strftime("%A"), orders.sum(&:total)] }
      if @expense_by_day.count < 7
        week_days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        data_hash = @expense_by_day.to_h
        current_day = Date.today.strftime("%A")
        current_day_index = week_days.index(current_day)
        next_day_index = (current_day_index + 1) % week_days.length
        ordered_days_with_current_last = week_days[next_day_index..-1] + week_days[0...next_day_index]
        complete_ordered_array_with_current_last = ordered_days_with_current_last.map{ |day| [day, data_hash.fetch(day, 0)] }
        @expense_by_day = complete_ordered_array_with_current_last
      end
  end
  def show
    @not_completed_pagy, @not_completed_orders= pagy(Order.where(email: current_handler.email).where(completed: false).order(created_at: :asc))
    @completed_pagy, @completed_orders = pagy(Order.where(email: current_handler.email).where(completed: true).order(created_at: :asc), page_param: :page_completed)
  end
end