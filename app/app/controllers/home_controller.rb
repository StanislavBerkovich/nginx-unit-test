class HomeController < ApplicationController
  def fibonacci
    n = params[:n].to_i
    render json: { n: n, fibonacci_n: calc_fibonacci(n) }
  end

  def nplus1
    histories = CustomerHistory.order('random()').first(params[:n].to_i)
    result = histories.each_with_object([]) do |h, r|
      r << [Customer.find(h.customerid).object_id, Order.find(h.orderid).object_id, Product.find(h.prod_id).object_id]
    end
    render json: { result: result }
  end

  def pg_sleep
    sleep_time = params[:ms].to_i / 1000.0
    times = params[:times].to_i
    times.times do
      ApplicationRecord.connection.execute("Select pg_sleep(#{sleep_time})")
    end
    render json: { sleep_time: sleep_time, times: times }
  end

  private

  def calc_fibonacci(n)
    return n if ( 0..1 ).include?(n)

    ( calc_fibonacci(n - 1) + calc_fibonacci(n - 2) )
  end

end
