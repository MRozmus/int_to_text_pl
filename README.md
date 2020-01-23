# int_to_text_pl
This gem allows you to change the integer number to Polish words by just one method. You can use it to automating create invos or whatever you wanna.
# Installation
You can install it by shell command: `$ gem install int_to_text_pl`

Or add this line to your Gemfile: `gem 'int_to_text_pl'`
# Code description
I created a module which i included to Integer class. I also added one method to this class called `to_text_pl`
# Usage
```
require 'int_to_text_pl'

1.to_text_pl #=> "Jeden"
963.to_text_pl #=> "Dziewięćset sześćdziesiąt trzy"
8558853.to_text_pl #=> "Osiem milionów pięćset pięćdziesiąt osiem tysięcy osiemset pięćdziesiąt trzy"
999999999999.to_text_pl #=> "Dziewięćset dziewięćdziesiąt dziewięć miliardow dziewięćset dziewięćdziesiąt dziewięć milionów dziewięćset dziewięćdziesiąt dziewięć tysięcy dziewięćset dziewięćdziesiąt dziewięć"
```
