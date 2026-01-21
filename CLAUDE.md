# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Textbringer::Markdown is a Ruby gem that provides Markdown syntax highlighting for the Textbringer text editor. The implementation is compact (83 lines) and uses regex-based pattern matching to highlight Markdown elements like headings, bold, italic, code blocks, links, lists, and blockquotes.

## Common Commands

### Development Setup
```bash
bin/setup              # Install dependencies
```

### Testing
```bash
rake spec              # Run tests via RSpec
rake                   # Default task (runs spec)
```

### Development Console
```bash
bin/console            # Interactive IRB prompt for experimentation
```

### Installation & Release
```bash
bundle exec rake install    # Install gem locally
bundle exec rake release    # Release new version (updates version in version.rb first)
```

## Architecture

### Core Implementation
All functionality is in `lib/textbringer/markdown.rb` (83 lines):

- **Face Definitions**: 10 color schemes for different Markdown elements (heading, bold, italic, code, code_block, link, url, quote, list, hr)
- **Syntax Rules**: 10 regex-based patterns using Textbringer's `define_syntax` API
- **File Pattern**: Matches `.md`, `.markdown`, `.mkd`, `.mdown`, `.mkdn`, `.mdwn` extensions
- **Buffer Settings**: Disables tab mode (uses spaces), sets tab width to 4

### Textbringer Integration
- Inherits from `Textbringer::Mode` base class
- Uses Textbringer's `Face.define` for color definitions
- Uses `define_syntax` with regex patterns for syntax highlighting
- Integrates automatically when matching file extensions are opened

### Regex Pattern Priority
Syntax rules are defined in order:
1. Headings → 2. Horizontal rules → 3. Code blocks → 4. Inline code → 5. Bold → 6. Italic → 7. Links → 8. URLs → 9. Blockquotes → 10. Lists

When modifying patterns, consider that earlier definitions may take precedence.

## Key Design Decisions

- **Single-file implementation**: All logic consolidated in one file for simplicity
- **Regex-based parsing**: No complex AST parsing, uses straightforward pattern matching
- **Minimal dependencies**: Only requires `textbringer >= 1.0`
- **No tab mode**: Markdown convention prefers spaces (enforced in buffer initialization)
