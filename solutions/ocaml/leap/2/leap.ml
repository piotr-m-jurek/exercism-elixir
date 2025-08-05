(* let is_divisable num divider = if  num mod divider = 0 then true else false *)

(* let leap_year year = if is_divisable year 100 then is_divisable year 400 else is_divisable year 4 *)

  let leap_year = function
    | year when year mod 400 = 0 -> true
    | year when year mod 100 = 0 -> false
    | year when year mod 4 = 0 -> true
    | _ -> false
    