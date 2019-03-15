class CashRegister
  attr_accessor :discount, :total

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    for i in 1..quantity
      @items << item
    end
    price
  end

  def apply_discount
    if @discount != nil
      self.total = self.total - ((@discount / 100.00) * self.total).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total - self.add_item(item, price, quantity = 1)
  end

end
