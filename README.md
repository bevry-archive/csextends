
<!-- TITLE/ -->

# Coffee-Script Extends

<!-- /TITLE -->


<!-- BADGES/ -->

[![Build Status](http://img.shields.io/travis-ci/bevry/csextends.png?branch=master)](http://travis-ci.org/bevry/csextends "Check this project's build status on TravisCI")
[![NPM version](http://badge.fury.io/js/csextends.png)](https://npmjs.org/package/csextends "View this project on NPM")
[![Dependency Status](https://david-dm.org/bevry/csextends.png?theme=shields.io)](https://david-dm.org/bevry/csextends)
[![Development Dependency Status](https://david-dm.org/bevry/csextends/dev-status.png?theme=shields.io)](https://david-dm.org/bevry/csextends#info=devDependencies)<br/>
[![Gittip donate button](http://img.shields.io/gittip/bevry.png)](https://www.gittip.com/bevry/ "Donate weekly to this project using Gittip")
[![Flattr donate button](http://img.shields.io/flattr/donate.png?color=yellow)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](http://img.shields.io/paypal/donate.png?color=yellow)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](http://img.shields.io/bitcoin/donate.png?color=yellow)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](http://img.shields.io/wishlist/browse.png?color=yellow)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

<!-- /BADGES -->


<!-- DESCRIPTION/ -->

Use the Coffee-Script extends keyword outside of Coffee-Script. Useful for easily extending existing existing classes, e.g. `require('csextends')(klass, extensions)`, and for providing your module consumers with an easy way to extend your classes, i.e. `Backbone.Model.extend(extensions)`.

<!-- /DESCRIPTION -->


<!-- INSTALL/ -->

## Install

### [NPM](http://npmjs.org/)
- Use: `require('csextends')`
- Install: `npm install --save csextends`

### [Browserify](http://browserify.org/)
- Use: `require('csextends')`
- Install: `npm install --save csextends`
- CDN URL: `//wzrd.in/bundle/csextends@1.0.2`

### [Ender](http://ender.jit.su/)
- Use: `require('csextends')`
- Install: `ender add csextends`

<!-- /INSTALL -->


## Usage

``` javascript
// Create a Class
var Person = function(name){
	this.name = name
}
Person.prototype.name = 'Unknown'
Person.prototype.hello = function(){
	console.log('Hello '+this.name+'!')
}

// Extend the class
var Child = require('csextends')(Person, {
	constructor: function(name, mother, father){
		this.name = name
		this.mother = mother
		this.father = father
	},
	mother: null,
	father: null,
	heyYaAll: function(){
		this.hello()
		this.mother.hello()
		this.father.hello()
	}
})

// Create some people
var eve = new Person('Eve')
var adam = new Person('Adam')
var me = new Child('me', eve, adam)
me.heyYaAll()
// Hello me!
// Hello Eve!
// Hello Adam!

// Is me still a person
console.log(me instanceof Person)  // true


// Now let's make this easier for people in the future
Person.prototype.subclass = require('csextends')
// Now, instead of doing:
//   var Child = require('csextends')(Person, extensions)
// We can now do:
//   var Child = Person.subclass(extensions)
// Which is very useful for module consumers.

// If you use CoffeeScript, you can accomplish the above by doing:
// class Person
//   @subclass: require('csextends')
// Then your javascript consumers can do:
//   var Child = Person.subclass(extensions)
// Just as before, which is really good for JavaScript users.
```


<!-- HISTORY/ -->

## History
[Discover the change history by heading on over to the `HISTORY.md` file.](https://github.com/bevry/csextends/blob/master/HISTORY.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/bevry/csextends/blob/master/CONTRIBUTING.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- Benjamin Lupton <b@lupton.cc> (https://github.com/balupton)

### Sponsors

No sponsors yet! Will you be the first?

[![Gittip donate button](http://img.shields.io/gittip/bevry.png)](https://www.gittip.com/bevry/ "Donate weekly to this project using Gittip")
[![Flattr donate button](http://img.shields.io/flattr/donate.png?color=yellow)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](http://img.shields.io/paypal/donate.png?color=yellow)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](http://img.shields.io/bitcoin/donate.png?color=yellow)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](http://img.shields.io/wishlist/browse.png?color=yellow)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

### Contributors

These amazing people have contributed code to this project:

- [Benjamin Lupton](https://github.com/balupton) <b@lupton.cc> — [view contributions](https://github.com/bevry/csextends/commits?author=balupton)

[Become a contributor!](https://github.com/bevry/csextends/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT license](http://creativecommons.org/licenses/MIT/)

Copyright &copy; 2013+ Bevry Pty Ltd <us@bevry.me> (http://bevry.me)

<!-- /LICENSE -->


