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

B = C = D = null

# Tests
joe.describe 'extendonclass', (describe, it) ->
	it 'should create the subclasses correctly', ->
		B = A.extend({
			name: 'unknown'
		})

		C = B.extend({
			constructor: (name) ->
				this.name = name.toUpperCase()  if name
				return
		})

		D = A.extend()

		return

	it 'should apply default attributes correctly', ->
		a = new A()
		expect(a.name).to.eql('default')

	it 'should apply default constructor correctly', ->
		aa = new A('bob')
		expect(aa.name).to.eql('bob')

	it 'should apply overwritten attributes correctly', ->
		b = new B()
		expect(b.name).to.eql('unknown')

	it 'should work with no extend prototype', ->
		d = new D()
		expect(d.name).to.eql('default')

	it 'should apply inherited constructor correctly', ->
		bb = new B('bob')
		expect(bb.name).to.eql('bob')

	it 'should apply inherited overwritten attributes correctly', ->
		c = new C()
		expect(c.name).to.eql('unknown')

	it 'should apply overwritten inherited constructor correctly', ->
		cc = new C('bob')
		expect(cc.name).to.eql('BOB')
