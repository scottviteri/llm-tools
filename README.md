# llm-tools

This repository contains tools for interacting with the Claude AI from within Emacs and the command line. It includes a Python script `lm.py` for interfacing with the Claude API, and an Emacs Lisp package `llm-tools.el` for integrating this functionality into Emacs.

## Installation

### Python script

1. Clone the repository:

```bash
git clone https://github.com/scottviteri/llm-tools.git
```

2. Navigate to the directory:

```bash
cd llm-tools
```

3. Add the directory to your PATH in your shell profile file. If you're using bash, you can add this line to your `~/.bashrc` or `~/.bash_profile`:

```bash
export PATH=$PATH:$(pwd)
```

If you're using zsh, add that line to your `~/.zshrc`.

### Emacs package

In your Emacs configuration file, add the following lines:

```elisp
(straight-use-package '("llm-tools" :type git :host github :repo "scottviteri/llm-tools"))
(require 'llm-tools)
```

## Usage

### Python script

You can call the `lm.py` script from the command line as follows:

```bash
lm --help
```

This will display the script's usage instructions.

### Emacs package

You can use the `call-claude` command provided by the `llm-tools` package in Emacs. Simply call `M-x call-claude` and follow the prompts.

## License

[MIT License](./LICENSE)
