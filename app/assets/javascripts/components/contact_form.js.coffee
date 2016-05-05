@ContactForm = React.createClass
  render: ->
    React.DOM.div
      className: 'nfc_contact_form padded_container'
      React.DOM.h2 null, 'Hello, Friend!'
      	React.DOM.ul null,
      		React.DOM.li null,
      			React.DOM.label null, 'What is your name?'
      			React.DOM.input
      				type: 'text'
      		
      		React.DOM.li null,
      			React.DOM.label null, 'Want to give me your '
      			React.DOM.input
      				type: 'email'
      				defaultValue: 'email'
      			React.DOM.label null, ' and/or '
      			React.DOM.input
      				type: 'text'
      				defaultValue: 'phone number'
      			React.DOM.label null, '?'

      		React.DOM.li null,
      			React.DOM.label null, 'Where did we meet?'
      			React.DOM.input
      				type: 'text'

      		React.DOM.li null,
      			React.DOM.button
      				type: 'submit'
      				'Keep in touch'