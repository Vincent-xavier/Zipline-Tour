SELECT JSON_OBJECT('result', JSON_ARRAYAGG(JSON_OBJECT('Events', persons))) AS _result
FROM (
  SELECT JSON_OBJECT('Date',sd.Date, 'fullDate',DATE_FORMAT(sd.Date,'%M %d %Y'), 'dayName',dayname(sd.Date), 'EventTimeSlots',JSON_ARRAYAGG(JSON_OBJECT('slotId',st.SlotId,'eventName', e.EventName, 'eventDiscription',e.EventDiscription,'price', e.Price,
'eventCapacity', e.EventCapacity,'eventImage', e.EventImage,'Time', cast(STR_TO_DATE(st.time, '%h:%i %p') AS datetime) ))) AS persons
  FROM tbl_events e 
	LEFT JOIN tbl_eventschedule es ON e.EventId = es.EventId
	LEFT JOIN tbl_eventscheduledates sd ON sd.ScheduleId = es.ScheduleId
	LEFT JOIN tbl_eventscheduletimeslots st ON sd.ScheduleId = st.ScheduleId and sd.DateId = st.DateId
  where e.IsDeleted = 0 and e.IsActive = 0 AND es.IsDeleted = 0 AND sd.IsDeleted = 0 AND st.IsDeleted = 0 AND sd.Date >= curdate()
  GROUP BY sd.Date
 ORDER BY sd.Date, st.time
) AS p;