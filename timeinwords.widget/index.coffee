#
# Time in Words widget for Übersicht
# Raphael Hanneken
# behoernchen.github.io
#


#
# Adjust the styles as you like
#
style =
  # Define the maximum width of the widget.
  width: "45%"

  # Define the position, where to display the time.
  # Set properties you don't need to "auto"
  position:
    top:    "auto"
    bottom: "24%"
    left:   "auto"
    right:  "2%"


  # Font properties
  font:            "'Helvetica Neue', sans-serif"
  font_color:      "#F5F5F5"
  font_size:       "6vw"
  font_weight:     "100"
  letter_spacing:  "0.025em"
  line_height:     ".9em"

  # Text shadow
  text_shadow:
    blur:     "0px"
    x_offset: "1px"
    y_offset: "1px"
    color:    "rgba(0, 0, 0, .4)"

  # Misc
  text_align:     "right"
  text_transform: "uppercase"


# Get the current hour as word.
command: "echo hello"

# Lower the frequency for more accuracy.
refreshFrequency: (1000 * 3) # (1000 * n) seconds


render: (o) -> """
  <div id="content">
    <span id="hours"></span><br>
    <span id="minutes"></span>
  </div>
"""


update: (output, dom) ->
  hours = [null, "one", "two", "three", "four", "five", "six", "seven",
    "eight", "nine", "ten", "eleven", "twelve"]
  ones = [null, "one", "two", "three", "four", "five", "six", "seven",
    "eight", "nine"]
  teens = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
    "sixteen", "seventeen", "eighteen", "nineteen"]
  tens = [null, null, "twenty", "thirty", "forty", "fifty"]

  date   = new Date()
  minute = date.getMinutes()
  hour   = date.getHours()
  hour   = hour % 12
  hour   = 12 if hour == 0

  hour_str = hours[hour]
  if minute == 0
    minute_str = "o'clock"
  else if minute >= 1 && minute <= 9
    minute_str = "o'#{ones[minute]}"
  else if minute >= 10 && minute <= 19
    minute_str = teens[minute - 10]
  else
    minute_str = tens[minute.toString()[0..0]]
    if minute.toString()[1..1] != "0"
      minute_str += ones[minute.toString()[1..1]]

  $(dom).find("#hours").html(hour_str)
  $(dom).find("#minutes").html(minute_str)


style: """
  top: #{@style.position.top}
  bottom: #{@style.position.bottom}
  right: #{@style.position.right}
  left: #{@style.position.left}
  width: #{@style.width}
  font-family: #{@style.font}
  color: #{@style.font_color}
  font-weight: #{@style.font_weight}
  text-align: #{@style.text_align}
  text-transform: #{@style.text_transform}
  font-size: #{@style.font_size}
  letter-spacing: #{@style.letter_spacing}
  font-smoothing: antialiased
  text-shadow: #{@style.text_shadow.x_offset} #{@style.text_shadow.y_offset} #{@style.text_shadow.blur} #{@style.text_shadow.color}
  line-height: #{@style.line_height}

"""
