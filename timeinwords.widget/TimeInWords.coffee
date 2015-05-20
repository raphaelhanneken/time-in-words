# 
# Time in Words widget for Übersicht
# Raphael Hanneken
# behoernchen.github.io
#


# Get the current hour as word.
command: "ruby timeinwords.widget/hours.rb"

# Lower the frequency for more accuracy.
refreshFrequency: 5000

# Adjust the style as you like
style: """
	bottom 26%
	right 2%
	width 100%
	font-family 'Helvetica Neue', sans-serif
	color #E8E6DF
	text-shadow: 1px 1px 0px rgba(50,50,50, .4)
	text-align right
	font-weight 100
	letter-spacing 0.18em
	font-smoothing: antialiased

	#hours
		font-size 12em
		text-transform uppercase

	#minutes
		font-size 7em
		line-height .2em
		text-transform uppercase
"""


render: (o) -> """
	<div id="content">
		<span id="hours"></span>
		<br>
		<span id="minutes"></span>
	</div>
"""


update: (output, dom) ->
	$(dom).find('#hours').html(output)
	@run("ruby timeinwords.widget/minutes.rb", (err, output) ->
			$(dom).find('#minutes').html(output)
	)
