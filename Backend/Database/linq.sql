SELECT sd.Date
FROM tbl_events e 
LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId AND sd.DateId = st.DateId
WHERE e.IsDeleted = 0 AND e.IsActive = 0 AND es.IsDeleted = 0 AND sd.IsDeleted = 0 AND st.IsDeleted = 0 AND sd.Date >= curdate()
group by sd.Date
ORDER BY sd.Date,times;

SELECT st.SlotId, sd.Date, e.EventName,e.Price,e.EventCapacity, e.Min_Booking, e.Max_Booking, e.EventImage,
CAST(CAST(STR_TO_DATE(st.time, '%h:%i %p') as time) AS CHAR) AS orderbyTime, st.Time
FROM tbl_events e 
LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId AND sd.DateId = st.DateId
WHERE e.IsDeleted = 0 AND e.IsActive = 0 AND es.IsDeleted = 0 AND sd.IsDeleted = 0 AND st.IsDeleted = 0 AND sd.Date >= curdate()
ORDER BY sd.Date,orderbyTime;