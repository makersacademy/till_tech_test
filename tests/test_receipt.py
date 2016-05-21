import unittest
import json
from unittest.mock import MagicMock
from app.receipt import Receipt

class ReceiptTestCase(unittest.TestCase):

    def setUp(self):
        menu = { "Latte": 4.75, "Capuccino": 3.85 }
        self.order = MagicMock()
        self.receipt = Receipt(self.order, menu)

    def test_output_as_json(self):
        self.order.show_items = MagicMock(return_value = { "Latte": 1, "Capuccino": 2 })
        self.order.calculate_tax = MagicMock(return_value = 1.08)
        self.order.total = MagicMock(return_value = 13.53)
        expected_output = {
            "Latte": "1 x $4.75",
            "Capuccino": "2 x $3.85",
            "Tax": "$1.08",
            "Total": "$13.53"
        }
        self.assertEqual(self.receipt.output_as_json(), json.dumps(expected_output))
