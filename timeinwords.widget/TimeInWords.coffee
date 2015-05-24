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
		blur: 		"0px"
		x_offset: "1px"
		y_offset: "1px"
		color:    "rgba(0, 0, 0, .4)"

	# Misc
	text_align:     "right"
	text_transform: "uppercase"


# Get the current hour as word.
command: "ruby timeinwords.widget/hours.rb"

# Lower the frequency for more accuracy.
refreshFrequency: (1000 * 3) # (1000 * n) seconds


render: (o) -> """
	<div id="content">
		<span id="hours"></span><br>
		<span id="minutes"></span>
	</div>
"""


update: (output, dom) ->
	$(dom).find("#hours").html(output)
	@run("ruby timeinwords.widget/minutes.rb", (err, output) ->
			$(dom).find('#minutes').html(output)
	)


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
