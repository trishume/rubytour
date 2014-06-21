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

# String#scrub

- This one is new in Ruby 2.1. It stops messed up unicode input from crashing your program.
- Checking if it is just me who has this problem with finding bad data on the internet: has anyone else had a ruby script crash because of malformed UTF characters?

# String#ljust

- Useful for text based output where you want things to line up, especially tables.

# Array#transpose

Useful for grid based programs, especially A.Is
