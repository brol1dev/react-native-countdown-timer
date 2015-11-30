var React = require('react-native');
var {
	requireNativeComponent,
	NativeMethodsMixin,
	View,
} = React;

var CountdownView = React.createClass({
	propTypes: {
		...View.propTypes,

		time: React.PropTypes.number,
		radius: React.PropTypes.number,
		fillColor: React.PropTypes.string,
		fillAlpha: React.PropTypes.number,
		strokeColor: React.PropTypes.string,

		onTimerUpdate: React.PropTypes.func,
		onTimerCompleted: React.PropTypes.func,
	},

	_onTimerUpdate: function(event: Event) {
		this.props.onTimerUpdate && this.props.onTimerUpdate(event.nativeEvent);
	},

	_onTimerCompleted: function(event: Event) {
		this.props.onTimerCompleted && this.props.onTimerCompleted(event.nativeEvent);
	},

	render: function() {
		return <NativeCountdownView
			{...this.props}
			onTimerUpdate={this._onTimerUpdate}
			onTimerCompleted={this._onTimerCompleted} />
	},
});

var NativeCountdownView = requireNativeComponent('CountdownView', CountdownView, {
	nativeOnly: {
		onTimerUpdate: true,
		onTimerCompleted: true,
	},
});

module.exports = CountdownView;