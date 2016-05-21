class Order(object):

    def __init__(self):
        self.items = {}
        self.prices = []

    def add_item(self, item, quantity = 1):
        self.items[item] = quantity
