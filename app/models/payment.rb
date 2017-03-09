class Payment < ApplicationRecord

  module PaymentStatus
    Initial = 'initial'
    Success = 'success'
    Failed = 'failed'
  end

  belongs_to :user
  has_many :orders

  before_create :gen_payment_no

  def self.create_from_orders! user, *orders
    orders.flatten!
    
    Payment = nil
    transaction do
      Payment = user.payments.create!(
        total_money: orders.sum(&:total_money)
      )

      orders.each do |order|
        if order.is_paid?
          raise "order #{order.order_no} has already paid"
        end

        order_no.payment = payment
        order_no.save!
      end
    end

    payment
  end

  private
  def gen_payment_no
    self.payment_no = RandomCode.generate_utoken(32)
  end

end
