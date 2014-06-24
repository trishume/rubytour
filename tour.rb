# A Tour of the Ruby Standard Library
# Generator Script
# By Tristan Hume

require "tempfile"

def ri_doc(q)
  text = `ri -T --format=markdown #{q}`

  ind = text.index("# Class methods:")
  text = text[0..(ind-1)] if ind

  text.rstrip!
  text << "\n"

  text.gsub!(/^#([^ #])/,' #\1')
  text.gsub!("---\n", '')
  text.gsub!("(from ruby core)\n", '')
  # text.gsub!(/^    (.*)$/,'`\1`{.ruby}')
  text.gsub!("\n#","\n##")

  newlines = []
  chunks = text.lines.chunk {|l| (l =~ /^    [^-].*$/) != nil}
  chunks.each.with_index do |chunk, i|
    indent, lines = chunk
    if indent
      newlines << "```ruby\n"
      newlines += lines.map {|l| l[4..-1]}
      newlines << "```\n"
    else
      newlines += lines
    end
  end
  text = newlines.join

  # text = "<span class='docs'>\n" + text + "</span>\n"

  text
end

file = ARGV[0] || 'presentation.md'

out = 'presentation.html'
temp = 'processed.md'

source = File.read(file)
processed = source.gsub(/<!-- (.*) -->/) { ri_doc($1) }
File.open(temp, 'w') {|f| f.write processed}

system("pandoc -w dzslides --standalone #{temp} > #{out}")

# css = File.read('styles.css')
presentation = File.read('presentation.html')
style = "<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">"
# scripts = "<script>#{script}</script>"
scripts = ''
presentation.sub!('</head>', "#{style}#{scripts}</head>")

File.open('presentation.html', 'w') do |fh|
  fh.puts presentation
end
