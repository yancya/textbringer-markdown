# frozen_string_literal: true

require "test_helper"

class Textbringer::MarkdownTest < Test::Unit::TestCase
  test "VERSION is defined" do
    assert do
      ::Textbringer::Markdown.const_defined?(:VERSION)
    end
  end

  test "MarkdownMode class exists" do
    assert do
      defined?(Textbringer::MarkdownMode)
    end
  end

  test "MarkdownMode file pattern matches .md files" do
    assert do
      Textbringer::MarkdownMode.file_name_pattern =~ "test.md"
    end
  end

  test "MarkdownMode file pattern does not match .txt files" do
    assert_nil(Textbringer::MarkdownMode.file_name_pattern =~ "test.txt")
  end
end
