guard 'livereload' do
  watch("presentation.html")
  watch("styles.css")
end

guard :shell do
  # If any of these change run the script to build presentation.html
  watch('presentation.md') {`ruby tour.rb`}
  watch('tour.rb') {`ruby tour.rb`}
end
