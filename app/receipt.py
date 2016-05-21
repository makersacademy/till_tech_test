import json

class Receipt(object):

    def __init__(self, order, menu):
        self._order = order
        self._menu = menu

    def output_as_json(self):
        receipt = {}
        for item in self._order.show_items():
            receipt[item] = self._format_line(item)
        receipt["Tax"] = self._format_currency(self._order.calculate_tax())
        receipt["Total"] = self._format_currency(self._order.total())
        return json.dumps(receipt)

    def _format_line(self, item):
        quantity = self._order.show_items()[item]
        price = self._menu[item]
        return "{} x ${}".format(quantity, price)

    def _format_currency(self, price):
        return "${}".format(price)
