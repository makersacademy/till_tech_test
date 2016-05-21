import unittest
from app.order import Order

class OrderTestCase(unittest.TestCase):

    def setUp(self):
        self.order = Order()

    def test_items_default_empty(self):
        self.assertEqual(self.order.items, {})

    def test_prices_default_empty(self):
        self.assertEqual(self.order.prices, [])

    def test_add_item(self):
        self.order.add_item("Latte", 2)
        self.assertEqual(self.order.items, { "Latte": 2 })
