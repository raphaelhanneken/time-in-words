minute = Time.now.min

ones   = %w{ nil one two three four five six seven eight nine }
teens  = %w{ ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen }
tens   = %w{ nil nil twenty thirty forty fifty }

minute_str = case minute
      			   when 0 then
      			     'o\'clock'
      			   when 1..9 then
      			     "o'#{ ones[minute] }"
      			   when 10..19 then
      			     teens[minute - 10]
      			   else 
      			     tens[minute.to_s[0,1].to_i] + (minute.to_s[1,1].to_i == 0 ? '' : "#{ ones[minute.to_s[1,1].to_i] }")
      			 end

print minute_str
