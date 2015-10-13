class RootConstraint
  def matches?(request)
    request.env['warden'].user.present?
  end
end
