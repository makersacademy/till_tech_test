import unittest
from unittest.mock import MagicMock
from app.order import Order

class OrderTestCase(unittest.TestCase):

    def setUp(self):
        self.sample_prices = { "Latte": 4.75, "Capuccino": 3.85 }
        self.order = Order(self.sample_prices)

    def test_items_default_empty(self):
        self.assertEqual(self.order.items, {})

    def test_initializes_with_prices(self):
        self.assertEqual(self.order.prices, self.sample_prices)

    def test_add_item(self):
        self.order.add_item("Latte", 2)
        self.assertEqual(self.order.items, { "Latte": 2 })

    def test_sum_items(self):
        self.order.add_item("Latte", 2)
        self.order.add_item("Capuccino", 2)
        self.assertEqual(self.order.sum(), 17.2)
