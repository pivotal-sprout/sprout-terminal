# sprout-terminal cookbook
A Chef Cookbook of Recipes to Configure the Terminal Application

# Requirements
* ruby
* bundler

# Usage

```
bundle install
soloist run_recipe sprout-terminal
```

To run *only* the close\_window\_on\_exit recipe:
```
soloist run_recipe sprout-terminal::close_window_on_exit
```


# Attributes
*NOTE:* All preferences are namespaced under `sprout => terminal` they include:
* close_on_exit &mdash; Closes the terminal window/tab on clean exit; the default is `true`;
* default_profile &mdash; Sets the default terminal profile (accessed via **Preferences &rarr; Settings**); default is `'Basic'`; 
* update_font &mdash; Updates the font to whatever binary is defined in `font_src`; default is `false`
* font_src &mdash; Location of the font binary property list file to download. create a file of this nature is beyond the scope of this document; default points to a Menlo-Regular 18pt font.

To modify attributes (i.e. to configure your terminal settings), add an entry into your `soloistrc` file and run the recipe via soloist:
```ruby
node_attributes:
  sprout:
    terminal:
      default_profile: 'Pro'
      update_font: true
```
# Recipes
`sprout-terminal::default` &mdash; runs all of the following recipes

1. `sprout-terminal::set_profile`
1. `sprout-terminal::update_font`
1. `sprout-terminal::close_window_on_exit`
1. `sprout-terminal::reload`

if you want your script to notify you if you are using Terminal to change Terminal then you can also run this recipe
`sprout-terminal::check_for_active`

# Author
* [Jonathan Barnes](http://github.com/codeword)
* [Brian Cunnie](http://github.com/cunnie)
