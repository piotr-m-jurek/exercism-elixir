let is_divisable num divider = if  num mod divider = 0 then true else false

let leap_year year = if is_divisable year 100 then is_divisable year 400 else is_divisable year 4
  