SITE_NAME = "rubytour"
DEPLOY_PATH = ENV['SITE_DEPLOY_PATH']
SITE_ROOT = File.join(DEPLOY_PATH, SITE_NAME)

desc "Deploy working copy of site"
task :deploy do
  raise "No deploy path" unless DEPLOY_PATH
  cp "index.html", SITE_ROOT
  cp "styles.css", SITE_ROOT
end
