import unittest
from app.order import Order

class OrderTestCase(unittest.TestCase):

    def setUp(self):
        self.sample_menu = { "Latte": 4.75, "Capuccino": 3.85 }
        self.order = Order(self.sample_menu)
        self.order.add_item("Latte")
        self.order.add_item("Capuccino", 2)

    def test_sum_items(self):
        self.assertEqual(self.order.sum_items(), 12.45)

    def test_calculate_tax(self):
        self.assertEqual(self.order.calculate_tax(), 1.08)

    def test_total(self):
        self.assertEqual(self.order.total(), 13.53)
