# frozen_string_literal: true

require_relative "markdown/version"

# Markdown Mode Plugin for Textbringer
# Provides syntax highlighting for Markdown files

module Textbringer
  # Define faces for Markdown syntax elements
  Face.define :markdown_heading, foreground: "cyan", bold: true
  Face.define :markdown_bold, foreground: "yellow", bold: true
  Face.define :markdown_italic, foreground: "green"
  Face.define :markdown_code, foreground: "magenta"
  Face.define :markdown_code_block, foreground: "magenta", bold: true
  Face.define :markdown_link, foreground: "blue", underline: true
  Face.define :markdown_url, foreground: "blue"
  Face.define :markdown_quote, foreground: "yellow"
  Face.define :markdown_list, foreground: "cyan"
  Face.define :markdown_hr, foreground: "white", bold: true

  class MarkdownMode < Mode
    self.file_name_pattern = /\.md\z/i

    # Headings (# ## ### etc)
    define_syntax :markdown_heading, /
      ^ [ \t]* \#{1,6} [ \t]+ .+? $
    /x

    # Horizontal rules (--- or *** or ___)
    define_syntax :markdown_hr, /
      ^ [ \t]* (?: [-*_] [ \t]* ){3,} $
    /x

    # Code blocks (```...``` or indented by 4 spaces)
    define_syntax :markdown_code_block, /
      (?: ^ [ \t]* ``` .*? $ .*? ^ [ \t]* ``` [ \t]* $ ) |
      (?: ^ [ \t]{4,} .+ $ )
    /xm

    # Inline code (`code`)
    define_syntax :markdown_code, /
      (?<!`) ` [^`\n]+ `(?!`)
    /x

    # Bold (**text** or __text__)
    define_syntax :markdown_bold, /
      (?: \*\* [^\*\n]+ \*\* ) |
      (?: __ [^_\n]+ __ )
    /x

    # Italic (*text* or _text_)
    define_syntax :markdown_italic, /
      (?: (?<!\*) \* [^\*\n]+ \* (?!\*) ) |
      (?: (?<!_) _ [^_\n]+ _ (?!_) )
    /x

    # Links ([text](url) or [text][ref])
    define_syntax :markdown_link, /
      \[ [^\]]+ \] (?: \( [^\)]+ \) | \[ [^\]]* \] )
    /x

    # URLs (http:// or https://)
    define_syntax :markdown_url, /
      https?:\/\/ [^\s<>]+
    /x

    # Blockquotes (> text)
    define_syntax :markdown_quote, /
      ^ [ \t]* > .*? $
    /xm

    # List markers (-, *, +, 1.)
    define_syntax :markdown_list, /
      ^ [ \t]* (?: [-*+] | \d+\. ) [ \t]+
    /x

    def initialize(buffer)
      super(buffer)
      @buffer[:indent_tabs_mode] = false
      @buffer[:tab_width] = 4
    end
  end
end
