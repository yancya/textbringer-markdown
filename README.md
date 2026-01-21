# Textbringer::Markdown

A Textbringer plugin that provides Markdown syntax highlighting with support for headings, code blocks, links, lists, and more.

## Features

- Syntax highlighting for Markdown elements:
  - Headings (`#` through `######`)
  - Bold (`**text**` or `__text__`)
  - Italic (`*text*` or `_text_`)
  - Inline code (`` `code` ``)
  - Code blocks (triple backticks or 4-space indented)
  - Links (`[text](url)`)
  - URLs (`http://` or `https://`)
  - Blockquotes (`> text`)
  - Lists (`-`, `*`, `+`, or numbered)
  - Horizontal rules (`---`, `***`, or `___`)

- Automatically activates for `.md` files
- Configures buffer settings for Markdown editing (spaces instead of tabs, tab width 4)

## Installation

Install the gem by executing:

```bash
gem install textbringer-markdown
```

Or add it to your Gemfile:

```bash
bundle add textbringer-markdown
```

## Usage

The plugin is automatically loaded when you start Textbringer. Simply open any `.md` file and syntax highlighting will be applied automatically.

No additional configuration is required.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yancya/textbringer-markdown.

## License

The gem is available as open source under the terms of the [WTFPL](http://www.wtfpl.net/).
