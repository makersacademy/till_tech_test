import unittest
from unittest.mock import MagicMock
from app.order import Order

class OrderTestCase(unittest.TestCase):

    def setUp(self):
        self.sample_menu = { "Latte": 4.75, "Capuccino": 3.85 }
        self.order = Order(self.sample_menu)

    def test_initializes_with_menu(self):
        self.assertEqual(self.order.show_menu(), self.sample_menu)

    def test_add_and_sum_items(self):
        self.order.add_item("Latte", 2)
        self.order.add_item("Capuccino", 2)
        self.assertEqual(self.order.sum_items(), 17.2)
