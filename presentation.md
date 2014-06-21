% The Ruby Standard Library
% Tristan Hume
% June 24, 2014

# Best Library
- 20,964 Functions and Classes
- Contains Core classes and Built in Libraries
- Well documented (mostly)
- No need for dependencies
- This presentation contains a curated introduction to some of the coolest and most interesting parts.

# Looking it Up
- [Dash](http://kapeli.com/dash): Amazing OSX fast local documentation
- [omniref](https://www.omniref.com/): Online ruby documentation search
- [Ruby-Doc](http://www.ruby-doc.org/stdlib-2.1.2/): Browse the standard library

# Part 1: Basic Classes
- The Base classes have TONS of extremely useful methods
- Maximizes ninja skills obtained per unit effort

```ruby
>> [].methods.length
=> 171
>> ''.methods.length
=> 166
>> 42.methods.length
=> 132
>> [].methods.shuffle.take(7)
=> [:all?, :transpose, :uniq!, :sort!, :shift, :*, :slice]
```

# Symbol#to_proc
- The `&` operator calls `to_proc` on it's argument and passes it as a block.
- The Symbol#to_proc method returns a proc that calls that method on it's parameter.
- Makes for much shorter calls to many standard library functions.

```ruby
>> ['HeLLO', 'oTTAWA', 'RuBy'].map(&:capitalize).join(' ')
=> "Hello Ottawa Ruby"
>> ['HeLLO', 'oTTAWA', 'RuBy'].map {|s| s.capitalize}.join(' ')
=> "Hello Ottawa Ruby"
```

# Loops

- Many different looping methods instead of a couple catch-all constructs
- One of Ruby's major differences from most languages

```ruby
>> 4.times {|i| 3.downto(i) {|j| print j, ' '}}
3 2 1 0 3 2 1 3 2 3
>> "Hello World!".split.each do |w|
?>     puts w
>>  end
Hello
World!
=> ["Hello", "World!"]
>> loop { puts "again!" }
again!
...
```

# Benefits

- Easier to see the intention of the loop, reads like English.
- Harder to make off-by-one mistakes.

```c
// C for loop
for(int i = 0; i < 3; ++i)
  printf("how many times?");
```

```ruby
# Ruby makes the intent clear
3.times { puts "3 times!" }

# Does the same thing but conveys
# the intent to iterate certain numbers
(0..2).each {|i| puts "3 times!"}
```

# The Best Break Around

- Unique feature of Ruby (AFAIK): break is a generic block based construct
- Also works with `next`

```ruby
def twice
  yield
  yield
end

twice do
  puts "hi"
  break
end
#=> hi
```

<!-- Integer.times -->

```ruby
5.times.select {|n| n.even?}.each {|i| print i, ' '}
#=> 0 2 4
```

<!-- Enumerator#with_index -->

```ruby
['zero', 'next', 'five!'].each.with_index do |e, i|
  print "#{i}:#{e} "
end
#=> 0:zero 1:next 2:five!
```

# String Manipulation

```ruby
>> "hello there\n".chomp.capitalize.gsub('there', 'World')
#=> "Hello World"
>> "rofl" * 20
=> "roflroflroflroflroflroflroflroflroflroflroflroflroflroflroflroflroflroflroflrofl"
>> 500.to_s(16)
=> "1f4"
>> "1f4".to_i(16)
=> 500
```

<!-- String#gsub -->

<!-- String#scrub -->

<!-- String#ljust -->

```ruby
# More fancy padding methods
"hello".rjust(20)           #=> "               hello"
"hello".center(20)          #=> "       hello        "
```

<!-- IO.read -->

<!-- Dir.glob -->

# Example

```ruby
# Dir[] is an alias of Dir.glob()
Dir['**/*.md'].each do |f|
  lines = IO.read(f).count("\n")
  puts "#{f}: #{lines}"
end
#=> notes.md: 52
#=> presentation.md: 164
#=> tour.md: 112
```

# Time

```ruby
>> Time.now
=> 2014-06-20 18:35:53 -0400
>> Time.now.tuesday?
=> true
>> require 'time'
>> Time.parse('6:00')
=> 2014-06-20 06:00:00 -0400
```

<!-- Time#parse -->

# Enumerable Mastery

`find_all` the ways you can become a ruby ninja, `select` the right ones, `collect` them in your mind, and then be `lazy` and don't actually do anything.

```ruby
# Finds most common starting letter in English
File.open('/usr/share/dict/words','r').map(&:downcase)
  .chunk(&:ord).map {|c, l| [c.chr, l.length]}
  .sort_by(&:last).take(3)  # => ["s", 25162]
```

<!-- Enumerable.map -->

<!-- Enumerable.reduce -->

<!-- Enumerable.select -->
```ruby
[1,2,3,4,5].reject { |num|  num.even?  } #=> [1, 3, 5]
```

<!-- Enumerable.all? -->
```ruby
# any? also exists
%w[ant bear cat].any? { |word| word.length >= 4 } #=> true
```

# Maxes and Mins

```ruby
>> a = 10.times.map { rand(10) }
=> [4, 1, 0, 5, 5, 2, 3, 7, 6, 0]
>> a.max
=> 7
>> a.min
=> 0
>> a.minmax
=> [0, 7]
>> a.max_by {|n| n % 4}
=> 3
```

<!-- Enumerable.grep -->

<!-- Enumerable.lazy -->

<!-- Array#permutation -->
<!-- Array#flatten -->
<!-- Array#transpose -->
