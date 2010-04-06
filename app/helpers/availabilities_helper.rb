module AvailabilitiesHelper
  def avail_populate_select(start_date)
    aReturn = []
    check_date = start_date.to_date
    end_date = check_date + 5.days
    trigger = Availability.find(:first,:select=>'event_date',:order=>'event_date ASC').event_date.to_date
    while (check_date + 7.days) > trigger
      aReturn << [check_date.to_s + " thru " + (check_date + 4.days).to_s,check_date]
      check_date = check_date - 7.days
      end_date = check_date + 5.days
    end
    return aReturn
  end
end
