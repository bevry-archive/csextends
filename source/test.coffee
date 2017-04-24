# Import
{expect, assert} = require('chai')
joe = require('joe')
csextends = require('../')

# Fixtures
class A
	name: 'default'

	constructor: (name) ->
		@name = name  if name

	@subclass: csextends

B = C = D = null

# Tests
joe.describe 'csextends', (describe, it) ->
	it 'should create the subclasses correctly', ->
		B = A.subclass({
			name: 'unknown'
		})

		C = B.subclass({
			constructor: (name) ->
				this.name = name.toUpperCase()  if name
				return
		})

		D = A.subclass()

		return

	it 'should maintain instanceof abilities', ->
		a = new A()
		expect(a).to.be.an.instanceof(A)
		b = new B()
		expect(b).to.be.an.instanceof(A)
		expect(b).to.be.an.instanceof(B)
		c = new C()
		expect(c).to.be.an.instanceof(A)
		expect(c).to.be.an.instanceof(B)
		expect(c).to.be.an.instanceof(C)
		d = new D()
		expect(d).to.be.an.instanceof(A)
		expect(d).to.be.an.instanceof(D)

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