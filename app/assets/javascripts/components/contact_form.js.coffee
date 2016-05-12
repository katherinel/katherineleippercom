@ContactForm = React.createClass
	getInitialState: ->
		displayForm: true
		errors: null
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

	resetToDefault: (e) ->
		if (e.target.value == '')
			e.target.value = this.props.placeholders["#{ e.target.name }"]
			@setState "#{ name }": e.target.value

	handleSubmit: (e) ->
		e.preventDefault()

		# Clear out the default values in the state, and do the ajax call as a callback
		# to ensure that setState is complete, otherwise the default values may still get 
		# passed in.
		stateObj = {}

		for key of @props.placeholders
			if (@state[key] == @props.placeholders[key])
				stateObj["#{key}"] = ''

		@setState(stateObj, () =>
			data =
				name: @state.name
				email: @state.email
				phone: @state.phone.replace(/[^a-zA-Z0-9]/g,'')
				met: @state.met
			$.ajax
				method: 'POST'
				url: '/contacts'
				dataType: 'JSON'
				data:
					contact: data
				success: (data) =>
					@setState { displayForm: false, errors: null }
				error: (data) =>
					errorData = $.parseJSON(data.responseText)
					@setState errors: errorData
					# reset back to defaults if blank
					for key of @props.placeholders
						if (@state[key] == '')
							@setState "#{key}": @props.placeholders[key]
		)

	errorText: (field) ->
		if (@state.errors && @state.errors["#{field}"])
			React.DOM.span
				className: 'error_messages'
				@state.errors["#{field}"].join(", ")

	showForm: ->
		React.DOM.form
			noValidate: 'novalidate'
			className: 'nfc_contact_form padded_container'
			onSubmit: @handleSubmit

			React.DOM.h2 null, 'Hello, friend!'
			React.DOM.ul null,
				React.DOM.li null,
					React.DOM.label null, 'What is your name?'
					React.DOM.span
						className: 'input_wrapper'
						React.DOM.input
							type: 'text'
							name: 'name'
							value: @state.name
							onChange: @handleChange
						@errorText('name')

				React.DOM.li null,
					React.DOM.label null, 'Want to give me your '
					React.DOM.span
						className: 'input_wrapper'
						React.DOM.input
							type: 'email'
							name: 'email'
							value: @state.email
							onChange: @handleChange
							onFocus: @clearDefault
							onBlur: @resetToDefault
						@errorText('email')

					React.DOM.label null, ' and/or '
					React.DOM.span
						className: 'input_wrapper'
						React.DOM.input
							type: 'tel'
							name: 'phone'
							value: @state.phone
							onChange: @handleChange
							onFocus: @clearDefault
							onBlur: @resetToDefault
						@errorText('phone')
					React.DOM.label null, '?'

				React.DOM.li null,
					React.DOM.label null, 'Where did we meet?'
					React.DOM.span
						className: 'input_wrapper'
						React.DOM.input
							type: 'text'
							name: 'met'
							value: @state.met
							onChange: @handleChange
						@errorText('met')

				React.DOM.li
					className: 'submit_button'
					React.DOM.button
						type: 'submit'
						'Keep in touch'

	showComplete: ->
		React.DOM.div
			className: 'nfc_contact_form padded_container'
			React.DOM.h2 null, "Nice to meet you at #{ @state.met }, #{ @state.name }!"

	render: ->
		if @state.displayForm
			@showForm()
		else
			@showComplete()
