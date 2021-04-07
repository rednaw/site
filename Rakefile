require "bundler/setup"
require "jekyll"
require "rubygems"
require "tmpdir"
require "fileutils"

GITHUB_REPONAME = "rednaw/rednaw.github.io"

task :generate do
  system "rm -r _site"
  Jekyll::Site.new(Jekyll.configuration({
    "source"      => ".",
    "destination" => "_site"
  })).process
end

task :publish => [:generate] do
  Dir.mktmpdir { |tmp|
    Dir.chdir(tmp) {
      system "git clone git@github.com:rednaw/rednaw.github.io.git"
    }
    system "find #{tmp}/rednaw.github.io -mindepth 1 -name .git -prune -o -exec rm -rf {} \;"
    system "cp -r _site/* #{tmp}/rednaw.github.io"
    Dir.chdir("#{tmp}/rednaw.github.io") {
      system "git status"
      puts '---'
      puts '---'
      system "git add ."
      system "git status"
      puts '---'
      puts '---'
      system "git commit -m 'Site updated'"
      system "git push"
    }
    system "git add ."
    system "git commit -m 'Site updated'"
    system "git push"
  }
end