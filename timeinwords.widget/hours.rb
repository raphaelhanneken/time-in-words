curr_hour = Time.now.strftime('%I').to_i
hours     = %w{ nil one two three four five six seven eight nine ten eleven twelve }

print hours[curr_hour]