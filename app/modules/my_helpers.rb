module MyHelpers

  def reset setting_name
    new_object = settings.send(setting_name).class.new
    settings.send(((setting_name.to_s + '=').to_sym),new_object)
  end

  def add_to_payments new_payment
    settings.payments = settings.payments.merge(new_payment)
  end

end

