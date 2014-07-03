module.exports.extendOnClass = (proto) ->
	klass = class extends @
		constructor: ->
			if proto?.hasOwnProperty('constructor')
				proto.constructor.apply(@, arguments)
			else
				super
	if proto?
		for own key,value of proto
			klass::[key] = value
	return klass