Sure, here's the revised README content reflecting the necessary changes:

---

# llm-tools

A collection of tools to enhance productivity, including a Python-based command-line tool and an Emacs Lisp package.

## Prerequisites
- Claude API Access (Note: An option to use the OpenAI API will be added in the future).

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/scottviteri/llm-tools.git
    ```

2. Change the permissions on the `lm` file to make it executable:

    ```bash
    chmod +x /path/to/llm-tools/lm
    ```

3. Add the directory containing the `lm` script to your system's PATH. This can be done in your shell profile file (like `~/.bashrc` or `~/.bash_profile` for bash, or `~/.zshrc` for zsh):

    ```bash
    export PATH=$PATH:/path/to/llm-tools
    ```

    Don't forget to source your profile file (or restart your terminal) to apply the changes:

    ```bash
    source ~/.bashrc
    ```

4. In your Emacs configuration, add the following lines to install the `llm-tools.el` package using `straight-use-package`:


    ```elisp
    (straight-use-package '(llm-tools :type git :host github :repo "scottviteri/llm-tools"))
    (require 'llm-tools)
    ```

5. Restart Emacs to apply the changes.

## Usage

The `lm` command-line tool can be used to interact with the Claude API and manage chat histories.

The `call-claude` function provided by `llm-tools.el` can be used within Emacs to send text to the `lm` tool and display the result. This requires `lm` to be in your system's PATH.

---

Please remember to replace "/path/to/llm-tools" with the actual path to the `llm-tools` directory on your system.

## License

[MIT License](./LICENSE)
