#!/usr/bin/env ruby
require 'bundler/inline'
require 'digest/md5'
require 'fileutils'
require 'pp'

gemfile do
  source 'https://rubygems.org'
  # gem 'bibtex-ruby', '~> 6'
  #gem 'nokogiri', '~> 1.11'
  # gem 'text', '~> 1.3'
end

def foo(path)
  result = Hash.new
  Dir["#{path}/*.pdf"].each { |f|
    result[Digest::MD5.hexdigest(File.read(f))] = f#.split('/')[7..9].join('/')
  }
  result
end

def html_entries()
  articles_html = File.join(__dir__, '..', 'marialoni.github.io', 'articles.html')
  html = Nokogiri::HTML(File.read(articles_html))
  html.xpath('//li/a').map { |node|
    node.text
  }
end

old_main_resources = foo(File.join(__dir__, '..', 'marialoni.github.io', 'resources'))
old_indef_resources = foo(File.join(__dir__, '..', 'marialoni.github.io', 'Indefinites', 'resources'))
old_resources = old_main_resources.merge(old_indef_resources)
new_resources = foo(File.join(__dir__, 'resources'))

todo = old_resources.select { |hash, filename|
  ! new_resources.key?(hash)
}.values

puts todo