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

# Enumerable Mastery

- Included in Array, String, File ...

```ruby
# Finds most common starting letter in English
File.open('/usr/share/dict/words','r').map(&:downcase)
  .chunk(&:ord).map {|c, l| [c.chr, l.length]}
  .max_by(&:last)  # => ["s", 25162]
```
