# frozen_string_literal: true

require_relative "lib/textbringer/markdown/version"

Gem::Specification.new do |spec|
  spec.name = "textbringer-markdown"
  spec.version = Textbringer::Markdown::VERSION
  spec.authors = ["yancya"]
  spec.email = ["yancya@upec.jp"]

  spec.summary = "Markdown syntax highlighting mode for Textbringer"
  spec.description = "A Textbringer plugin that provides comprehensive Markdown syntax highlighting with support for headings, code blocks, links, lists, and more."
  spec.homepage = "https://github.com/yancya/textbringer-markdown"
  spec.license = "WTFPL"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yancya/textbringer-markdown"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .rspec spec/ .github/])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "textbringer", ">= 1.0"
end
