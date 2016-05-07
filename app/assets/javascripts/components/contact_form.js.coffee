@ContactForm = React.createClass
	getInitialState: ->
		displayForm: true
		name: this.props.placeholders.name
		email: this.props.placeholders.email
		phone: this.props.placeholders.phone
		met: this.props.placeholders.met

	handleChange: (e) ->
		name = e.target.name
		@setState "#{ name }": e.target.value

	clearDefault: (e) ->
		if (e.target.value == this.props.placeholders["#{ e.target.name }"]) # if the target's value equals the original props value
			e.target.value = ''
			console.log('clear default')
			console.log(@state)

	resetToDefault: (e) ->
		if (e.target.value == '')
			e.target.value = this.props.placeholders["#{ e.target.name }"]
			@setState "#{ name }": e.target.value

	handleSubmit: (e) ->
		e.preventDefault()
		$.post '/contacts', { contact: @state }, (data) => 
			@setState displayForm: false
		, 'JSON'

	showForm: ->
		React.DOM.form
			className: 'nfc_contact_form padded_container'
			onSubmit: @handleSubmit

			React.DOM.h2 null, 'Hello, friend!'
			React.DOM.ul null,
				React.DOM.li null,
					React.DOM.label null, 'What is your name?'
					React.DOM.input
						type: 'text'
						name: 'name'
						value: @state.name
						onChange: @handleChange

				React.DOM.li null,
					React.DOM.label null, 'Want to give me your '
					React.DOM.input
						type: 'email'
						name: 'email'
						value: @state.email
						onChange: @handleChange
						onFocus: @clearDefault
						onBlur: @resetToDefault

					React.DOM.label null, ' and/or '
					React.DOM.input
						type: 'text'
						name: 'phone'
						value: @state.phone
						onChange: @handleChange
						onFocus: @clearDefault
						onBlur: @resetToDefault
					React.DOM.label null, '?'

				React.DOM.li null,
					React.DOM.label null, 'Where did we meet?'
					React.DOM.input
						type: 'text'
						name: 'met'
						value: @state.met
						onChange: @handleChange

				React.DOM.li null,
					React.DOM.button
						type: 'submit'
						'Keep in touch'

	showComplete: ->
		React.DOM.div
			className: 'padded_container'
			React.DOM.h2 null, "Nice to meet you at #{ @state.met }, #{ @state.name }!"

	render: ->
		if @state.displayForm
			@showForm()
		else
			@showComplete()
