% The Ruby Standard Library
% By Tristan Hume
% June 24, 2014

# Follow Along

## [http://thume.ca/rubytour](http://thume.ca/rubytour)

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
- `ri`: the built in command line documentation lookup tool

# Demo

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

# === (Case Equality)

- Used for checking if something matches a pattern.
- Defined on many built in Ruby classes including String, Regexp, Range
- Used by `case` statements, `String#gsub` and others.
- Rarely used directly, but good to understand.

```ruby
case obj
when /.*/; print "Check if string matches regex"
when Numeric; print "Check if obj inherits from a class"
when 5; print "Defaults to being the same as == for direct comparison."
end
```

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
Dir['*.md'].each do |f|
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
>> [5, 7].max
=> 7

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

<!-- Array#flatten -->
<!-- Array#transpose -->

# Extra Tools

- More specific mini-libraries
- There are 108 of these things!
- Use `require` to access

# All of Them (Favourites Bolded)

<span class="biglist">
**abbrev** base64 **benchmark** bigdecimal cgi cmath coverage csv date dbm debug delegate **digest** dl drb e2mmap English erb etc expect extmk fcntl fiddle fileutils find forwardable gdbm getoptlong gserver io/console io/nonblock io/wait ipaddr **json** ologger mathn matrix minitest minitest/benchmark minitest/spec mkmf monitor mutex_m net/ftp net/http net/imap net/pop net/smtp net/telnet nkf objspace observer open-uri open3 openssl optparse **ostruct** **pathname** **pp** prettyprint prime profile profiler pstore psych pty racc racc/parser rake rdoc readline resolv **rexml** rinda ripper rss scanf sdbm securerandom **set** shell shellwords singleton socket stringio strscan sync syslog tempfile test/unit thwait time timeout **tk** tmpdir tracer tsort uri weakref **webrick** **win32ole** xmlrpc **yaml** zlib
</span>

# PP (Pretty Print)

```ruby
>> require 'pp'
>> a = Array.new(5) { Array.new(5, 42) }
=> [[42, 42, 42, 42, 42], [42, 42, 42, 42, 42], [42, 42, 42, 42, 42], [42, 42, 42, 42, 42], [42, 42, 42, 42, 42]]
>> pp a
[[42, 42, 42, 42, 42],
 [42, 42, 42, 42, 42],
 [42, 42, 42, 42, 42],
 [42, 42, 42, 42, 42],
 [42, 42, 42, 42, 42]]
>> pp PP.new
#<PP:0x007fbb6c8047b8
 @buffer=[],
 @buffer_width=0,
 @genspace=
  #<Proc:0x007fbb6c804678@/usr/local/Cellar/ruby/2.1.2_1/lib/ruby/2.1.0/prettyprint.rb:84 (lambda)>,
 @group_queue=
  #<PrettyPrint::GroupQueue:0x007fbb6c804420
   @queue=
    [[#<PrettyPrint::Group:0x007fbb6c8044e8
       @break=false,
       @breakables=[],
       @depth=0>]]>,
 @group_stack=
  [#<PrettyPrint::Group:0x007fbb6c8044e8
    @break=false,
    @breakables=[],
    @depth=0>],
 @indent=0,
 @maxwidth=79,
 @newline="\n",
 @output="",
 @output_width=0>
```

# Internet Support!

- **net/ftp:** Write a script to deploy your website!
- **net/imap:** Write a script to read your emails and automatically visit verification links (totally insecure, don't actually do).
- **net/telnet:** Make a website for viewing `telnet towel.blinkenlights.nl`.
- **RSS:** Scrape the rss feed for your favourite Reddit user and email you their posts. Can also generate feeds.
- **Resolv:** Concurrent DNS resolver! Rapidly scan for available 5 character palindromic domain names.

# Testing, Optimizing, Debugging

- **Minitest:** Ruby's built in unit testing library.
- **Benchmark:** Time how long different things take, includes warm up runs and comparison table output.
- **Coverage:** analyzes how many times each line is run in a Ruby program.
- **Profiler:** built in profiler.

<!-- DEBUGGER__ -->

<!-- YAML -->

# Other Parsers

- **JSON**: Interface very similar to YAML but for JSON.
- **REXML**: Fully fancy XML library with XPath, DTDs, SAX and 7 different parsers.
- **CSV**: Good for reading in copy-pasted Excel tables and other internet data.
- **Base64**: Binary data as ASCII. Used in lots of random things.
- **Ripper**: Parse Ruby scripts into abstract syntax trees.
- **OptionParser**: Parses command line option formats like `--[no-]verbose`
- **Racc**: Generic parser generator for arbitrary grammars.

<!-- RDoc::Markdown -->

<!-- Pathname -->

<!-- OpenStruct -->

# Tk

Ruby's built in GUI library. Not suitable for fancy things but great for simple little programs.

```ruby
require 'tk'

root = TkRoot.new { title "Hello, World!" }
TkLabel.new(root) do
   text 'Hello, World!'
   pack { padx 15 ; pady 15; side 'left' }
end
Tk.mainloop
```

# Win32OLE

You are no longer allowed to even think about using Visual Basic.

```ruby
require 'win32ole'

excel = WIN32OLE.new('Excel.Application')
excel.visible = true
workbook = excel.Workbooks.Add();
worksheet = workbook.Worksheets(1);
worksheet.Range("A1:D1").value = ["North","South","East","West"];
worksheet.Range("A2:B2").value = [5.2, 10];
worksheet.Range("C2").value = 8;
worksheet.Range("D2").value = 20;

range = worksheet.Range("A1:D2");
range.select
chart = workbook.Charts.Add;

workbook.saved = true;

excel.ActiveWorkbook.Close(0);
excel.Quit();
```

# Mathn

mathn changes the way Ruby does math to be more precise, `Rational` and lispy.

```ruby
# Without mathn:
3 / 2 => 1 # Integer
20 / 9 * 3 * 14 / 7 * 3 / 2 # => 18

# With mathn:
require 'mathn'
3 / 2 => 3/2 # Rational
20 / 9 * 3 * 14 / 7 * 3 / 2 # => 20
```

mathn features late rounding and lacks truncation of intermediate results.

<!-- Prime -->

# The End

Learn to use the Standard Library, it's pretty cool.
