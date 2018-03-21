# Import
{equal} = require('assert-helpers')
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
		equal(a instanceof A, true)
		b = new B()
		equal(b instanceof A, true)
		equal(b instanceof B, true)
		c = new C()
		equal(c instanceof A, true)
		equal(c instanceof B, true)
		equal(c instanceof C, true)
		d = new D()
		equal(d instanceof A, true)
		equal(d instanceof D, true)

	it 'should apply default attributes correctly', ->
		a = new A()
		equal(a.name, 'default')

	it 'should apply default constructor correctly', ->
		aa = new A('bob')
		equal(aa.name, 'bob')

	it 'should apply overwritten attributes correctly', ->
		b = new B()
		equal(b.name, 'unknown')

	it 'should work with no extend prototype', ->
		d = new D()
		equal(d.name, 'default')

	it 'should apply inherited constructor correctly', ->
		bb = new B('bob')
		equal(bb.name, 'bob')

	it 'should apply inherited overwritten attributes correctly', ->
		c = new C()
		equal(c.name, 'unknown')

	it 'should apply overwritten inherited constructor correctly', ->
		cc = new C('bob')
		equal(cc.name, 'BOB')
