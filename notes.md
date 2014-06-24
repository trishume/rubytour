# Presentation Notes

# Best Library

- Good knowledge of the standard library helps you write code more quickly
- I personally find it's scope most useful during programming contests where you aren't allowed to use external libraries. Other competitors have to waste time writing simple algorithms like permutation while I simply call Array.permutations

# Looking it Up
Give demo of Dash

# Part 1: Basic Classes
- one of the most useful things to learn
- you can see that the most common classes have hundreds of methods built in
- taking a random sample we can see some interesting things you probably won't find
  in most other languages.

# Symbol#to_proc
- Start with a taste of what you'll learn
- One of my favourite examples
- A powerful method that not everyone knows

# Loops

- Looping methods are a powerful category of Ruby methods
- One of the things that is most different between Ruby and other scripting languages

# Benefits

- Using these methods you can convey your intention
- By matching the construct to your use case you make things easier to read
- When writing programming contests and this helps me avoid off-by-one bugs. While competitors are staring at piles of nested for loops I don't have to waste time checking that `5.times` runs the right number of times.

# The Best Break Around

- Lots of other languages have functional constructs like map and each, but as far as I know,
only Ruby has looping control flow constructs that work with this.
- Ruby's break can get out of any block based method, abandoning the rest of the caller's execution
- This also works with `next` which just skips past the end of the block.
- This means all of Ruby's fancy loops work exactly as you would expect built in loops to work

# Integer.times

the documentation for the simplest looping construct shows us that most loops actually can return an enumerator, which lets you call fancy enumerable methods on your loop.

# Enumerator#with_index

- When working with multiple arrays or numbering a list sometimes you want an index.
- with_index works with any enumerable method

# String Manipulation

- Ruby is great at string manipulation, in part because of it's roots in Perl.
- It has handy little methods, like `chomp` which removes a newline from a string if there is one
- You can even multiply strings.
- Another interesting little thing is that when converting between strings and integers you can pass in a base up to 36.

# String#gsub

- Very handy general purpose replacement with many forms.
- You can use either plain strings or a regex as a replacement pattern.
- Can also use a block to determine replacement.

# ===

- Lets take a short break from strings to explain one of the methods behind Ruby's magic.
- Remember how `gsub` could take a regex or a string as a pattern?
- Some Ruby classes have a method called `===` that is used for pattern matching.
- For objects that don't redefine it, it acts just like ==

# String#scrub

- This one is new in Ruby 2.1. It stops messed up unicode input from crashing your program.
- Checking if it is just me who has this problem with finding bad data on the internet: has anyone else had a ruby script crash because of malformed UTF characters?

# String#ljust

- Useful for text based output where you want things to line up, especially tables.

# IO.read

- This is really handy for scripting when you just want to quickly read an entire file into a string.
- Same thing as `File.read` since File inherits from IO

# Dir.glob

- Another method that's handy for scripts, this one returns an array of file names matching a standard unix glob pattern.
[Flip to example]

# Example

Here's an example script that combines Dir.glob's handy alias and Io.read by counting the lines in all the markdown files in the current directory.

# Time

- Even Time has some pretty handy methods, including one for each day of the week.
- Time also has an extra mini-library that includes some handy methods like `parse`
[Flip to parse slide]

# Time#parse

- Time.parse is actually really powerful, it can understand practically any common date or time format.
- So you don't have to worry if your dates conform to the correct format, parse will figure it out.

# Enumerable Mastery

- Now lets get into the most powerful module in all of Ruby.
- Enumerable is included in all sorts of classes like Array, String and even File
- Provides tons of common methods for working with collections of data
- It's so good that Javascript users install underscore.js just to get a small subset of it with ugly syntax.
- Watch as this example chains too many enumerable methods together to find the most common starting letter in the English dictionary.

# Enumerable.map

- We'll start with the most basic enumerable method.
- Map just applies a transformation on the input to produce an array of the output.
- Like all enumerable methods, map has an alternate form that returns an enumerator, which is itself an enumerable.

# Enumerable.reduce

- Also known as `inject` this method takes a bunch of values and joins them together with a method or a block.
- It's used for summing or multiplying lists of numbers as well as some more general things.
- Notice that unlike most methods you can directly pass in a symbol as a shortcut.
- Now you know combine `map`, `reduce` and a little bit of networking and you've learned the map-reduce algorithm. Map a function over your data, and then reduce all the bits into one result.

# Enumerable.select

- Enumerable also has a bunch of methods for filtering data.
- The most basic is select, which just applies a filter to the input to produce an array of the outputs for which the block returned true.
- The opposite method is `reject`, which filters out things for which the block returns true.

# Enumerable.all?

- Another class of enumerable methods is the predicates, these methods check if the input fits some condition.
- `all` is the most basic, it checks if all the elements of the input fit the filter
- There is also `any?` which checks if anything fits the filter.

# Maxes and Mins

- Almost every language has a function that returns the maximum or minimum of its parameters.
- New rubyists might have trouble finding it though since it is actually a method of Enumerable instead of a basic function.
- Both max and min work with arbitrarily large collections as well as having by variants that use a block to determine what to measure, which is handy for collections of complex objects.

# Enumerable.grep

- Enumerable even has a function like the grep command line tool.
- it acts like select but uses a pattern instead of a block, the pattern uses === so it can be anything you would use in a case statement.

# Enumerable.lazy

- Lazy enumerations only perform work when they need to, but in some cases are less efficient.
- Unlike non-lazy methods, they can handle infinite collections like this example enumeration of all pythagorean triples.

# Array#flatten

- Flatten makes multi-dimensional and nested arrays into a single level.
- This is useful when dealing with large nested array structures
- Also good for when you are using other enumerablem methods that may return arrays and you want to combine results into one level.

# Array#transpose

Useful for grid based programs, especially A.Is which have to run code for multiple directions.

# PP

- This is one of my favourite little libraries for debugging.
- It works like the `p` command but pretty prints 2d arrays, hashes and objects

# Internet Support!

- Ruby includes libraries for tons of common network protocols, the names explain a lot about what they do so instead here's a list of examples of what you could do with each of these libraries.

# Testing

- Ruby also includes libraries for testing, benchmarking, code coverage and profiling
- Except for Minitest, most of them are not really fancy and high quality, but they are good for quickly checking small programs.

# Debugger

- There's also a built in GDB-like command line debugger
- It's fairly easy to use, just require it where you want to break.
- Most of the time I use puts for debugging but sometimes it is useful to be able to step around.
- When I want to step around I don't really want to install a fancy debugger gem or switch to an IDE, I just want to insert one line of code.

# YAML

- Really handy library for data serialization
- I use it a lot for configuration files for small Ruby scripts
- Very easy to use

# Other Parsers

- Ruby also has parsers for lots of other things, including Ruby itself.

# Rdoc::Markdown

- While making this presentation I learned that Ruby actually comes with a Markdown library.
- You don't need to install one of the numerous markdown gems, the built in one even does Github flavoured markdown.
- Probably still a good idea to use a more standard markdown library though.

# Pathname

- Yet another handy thing for scripting.
- Has both path manipulation methods and things for checking the filesystem

# OpenStruct

- If you've ever yearned for more Javascript in your Ruby, or just not wanted to use hash brackets all the time, Openstruct is the class for you.
- It works like a hash but allows you to access fields using dot notation

# Tk

- Ruby has a built in crappy little GUI library, but sometimes a crappy little GUI is all you need.
- It's fairly easy to use but it's structure doesn't work well for larger programs.

# Win32OLE

- This library interfaces with the same Windows application scripting system used by Visual Basic for Applications.
- You can write Ruby scripts to control Excel, Word, Powerpoint and other programs.
- All Windows users in the audience are now forbidden from allowed to use Visual Basic.

- These last two libraries might seem a little sketchy, and they kind of are, but that doesn't mean they aren't useful.
- A couple years ago I was working for a company where I wrote a Ruby script in one afternoon that used a crappy Tk GUI, some fancy regexes, and Excel automation to perform document processing that had previously been done by 10 data entry workers. These things aren't pretty, but they get the job done.

# Mathn

Let's finish up with some cute little libraries that are mostly useful for showing off how much you know about Ruby.

Mathn is a library that makes Ruby math work more like Lisp by using rational numbers for higher precision arithmetic.

# Prime

The 'Prime' library is my proof that the developers of Ruby love CS geeks like me.
It is a built in prime number class that comes with a couple different generators.
It has basically no practical use since any real scientific computation needs much fancier processes, but it is perfect for solving arbitrary CS challenges like Project Euler problems and programming contests.

There is one other thing I've found it's useful for though, and that is, giving a presentation on all the cool and weird things in the Ruby standard library.

