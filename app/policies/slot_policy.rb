# frozen_string_literal: true

# Check the access policies for API::SlotsController
class SlotPolicy < ApplicationPolicy
  def update?
    # check that the update is allowed and the prevention delay has not expired
    delay = Setting.find_by(name: 'booking_move_delay').value.to_i
    enabled = (Setting.find_by(name: 'booking_move_enable').value == 'true')

    # these condition does not apply to admins
    user.admin? || user.manager? ||
      (record.reservation.user == user && enabled && ((record.start_at - DateTime.current).to_i / 3600 >= delay))
  end

  def cancel?
    user.admin? || user.manager? || record.reservation.user == user
  end
end
