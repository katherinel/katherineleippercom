@ContactForm = React.createClass
	getInitialState: ->
		displayForm: true
		name: ''
		email: 'email'
		phone: 'phone number'
		met: ''

	handleChange: (e) ->
		name = e.target.name
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

					React.DOM.label null, ' and/or '
					React.DOM.input
						type: 'text'
						name: 'phone'
						value: @state.phone
						onChange: @handleChange
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
