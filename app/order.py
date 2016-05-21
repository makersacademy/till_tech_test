class Order(object):

    def __init__(self, prices):
        self.items = {}
        self.prices = prices

    def add_item(self, item, quantity = 1):
        self.items[item] = quantity
