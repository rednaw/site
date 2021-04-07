require "bundler/setup"
require "jekyll"
require "rubygems"
require "tmpdir"

GITHUB_REPONAME = "rednaw/rednaw.github.io"

task :generate do
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
end

task :publish => [:generate] do
  Dir.mktmpdir { |tmp|
    cp_r "_site/.", tmp
    system "cp .gitignore #{tmp}"
    Dir.chdir(tmp) {
      system "git init"
      system "git add ."
      message = "Site updated at #{Time.now.utc}"
      system "git commit -m #{message.inspect}"
      system "git branch -M main"
      system "git remote add origin git@github.com:#{GITHUB_REPONAME}.git"
      system "git push -u origin main --force"
    }
  }
end