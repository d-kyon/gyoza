module AttendanceHelper
  def is_working(user)
    if Attendance.find_by(user_id:user.id).present? then
      last_attendance=Attendance.where(user_id:user.id).last
      if last_attendance.out_time.nil? then
        return true
      end
    end
  end
end
