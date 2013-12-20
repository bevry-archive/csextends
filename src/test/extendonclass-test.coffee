# Import
{expect, assert} = require('chai')
joe = require('joe')
{extendOnClass} = require('../../')

# Fixtures
class A
	name: 'default'

	constructor: (name) ->
		@name = name  if name

	@extend: extendOnClass

`
var B = A.extend({
	name: 'unknown'
});

var C = B.extend({
	constructor: function (name) {
		if ( name )  this.name = name.toUpperCase();
	}
});
`

# Tests
joe.describe 'extendonclass', (describe, it) ->

	it 'should apply default attributes correctly', ->
		a = new A()
		expect(a.name).to.eql('default')

	it 'should apply default constructor correctly', ->
		aa = new A('bob')
		expect(aa.name).to.eql('bob')

	it 'should apply overwritten attributes correctly', ->
		b = new B()
		expect(b.name).to.eql('unknown')

	it 'should apply inherited constructor correctly', ->
		bb = new B('bob')
		expect(bb.name).to.eql('bob')

	it 'should apply inherited overwritten attributes correctly', ->
		c = new C()
		expect(c.name).to.eql('unknown')

	it 'should apply overwritten inherited constructor correctly', ->
		cc = new C('bob')
		expect(cc.name).to.eql('BOB')
