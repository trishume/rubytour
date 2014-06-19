# A Tour of the Ruby Standard Library
# Generator Script
# By Tristan Hume

require "tempfile"

def ri_doc(q)
  text = `ri -T --format=markdown #{q}`

  ind = text.index("# Class methods:")
  text = text[0..(ind-1)] if ind

  text.gsub!(/^#([^ #])/,' #\1')
  text.gsub!("---\n", '')
  text.gsub!("(from ruby core)\n", '')
  text.gsub!(/^    (.*)$/,'`\1`{.ruby}')
  text.gsub!("\n#","\n##")
  text
end

file = ARGV[0] || 'presentation.md'

out = 'presentation.html'
temp = 'processed.md'

source = File.read(file)
processed = source.gsub(/<!-- (.*) -->/) { ri_doc($1) }
File.open(temp, 'w') {|f| f.write processed}

system("pandoc -w dzslides --standalone #{temp} > #{out}")

css = File.read('styles.css')
presentation = File.read('presentation.html')
style = "<style>#{css}</style>"
# scripts = "<script>#{script}</script>"
scripts = ''
presentation.sub!('</body>', "#{style}#{scripts}</body>")

File.open('presentation.html', 'w') do |fh|
  fh.puts presentation
end
