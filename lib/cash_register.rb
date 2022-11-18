class CashRegister
    attr_accessor :total, :discount, :items, :last_item_price

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += (price * quantity)
        added_item = 0
        while added_item < quantity
            self.items << title
            added_item += 1
        end 

        self.last_item_price = price * quantity
    end

    def apply_discount
        if self.discount > 0 
            discount_amount = self.total * (self.discount.to_f / 100)
            self.total = self.total - discount_amount
            "After the discount, the total comes to $#{self.total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.items.pop
        self.total -= self.last_item_price
    end
end