# sprout-terminal cookbook

[![Build Status](https://travis-ci.org/pivotal-sprout/sprout-terminal.svg?branch=master)](https://travis-ci.org/pivotal-sprout/sprout-terminal)

Configures OSX Terminal

## Usage

### Prerequisites

- [system ruby](.ruby-version)
- [bundler](http://bundler.io/)

### Quickstart

```
bundle
bundle exec soloist
```

## Cookbook Usage

### Attributes

*NOTE:* All preferences are namespaced under `sprout => terminal` they include:

* `default_profile` &mdash; Sets the default terminal profile (accessed via **Preferences &rarr; Settings**); default is `'Basic'`;
* `font_src` &mdash; Location of the font binary property list file to download. create a file of this nature is beyond the scope of this document; default points to a Menlo-Regular 18pt font.


### Recipes

1. `sprout-terminal` &mdash; The default recipe includes all of the following unless otherwise specified
1. `sprout-terminal::set_profile` &mdash; sets the default and startup profiles to the value of the `default_profile` attribute
1. `sprout-terminal::update_font` &mdash; a feature flag as to whether to update the font of the `default_profile` _note: this recipe is **not** part of the default recipe._
1. `sprout-terminal::close_window_on_exit` &mdash; sets the window to close of the shell exists cleanly
1. `sprout-terminal::reload` &mdash; since the terminal app is probably running during this script this forces it to reload it settings.

## Contributing

### Before committing

```
bundle
bundle exec rake
```

The default rake task includes rubocop, foodcritic, unit specs

### [Rubocop](https://github.com/bbatsov/rubocop)

```
bundle
bundle exec rake rubocop
```

### [FoodCritic](http://acrmp.github.io/foodcritic/)

```
bundle
bundle exec rake foodcritic
```

### Unit specs

Unit specs use [ServerSpec](http://serverspec.org/)

```
bundle
bundle exec rake spec:unit
```

### Integration specs

Integrations specs will run the default recipe on the host system (destructive) and make assertions on the system after
install.

*Note:* It has a precondition that keycastr is _not_ already installed on the system.

```
bundle
bundle exec rake spec:integration
```
