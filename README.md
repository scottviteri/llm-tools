# llm-tools

llm-tools is a collection of productivity tools designed to enhance the interaction between Language Models (LMs) and text editors. The project aims to provide a more flexible and high-level workflow for LMs, enabling them to assist with coding tasks more effectively. The tools include a Python-based command-line tool and an Emacs Lisp package.

## Prerequisites
- Claude API Access (Note: An option to use the OpenAI API will be added in the future).

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/scottviteri/llm-tools.git
    ```

2. Change the permissions on the `lm_cli.py` file to make it executable:

    ```bash
    chmod +x /path/to/llm-tools/lm-cli.py
    ```

3.  Create a symbolic link to `lm_cli.py` named `lm` in a directory that's on your system's PATH (like `/usr/local/bin`):


    ```bash
    ln -s /path/to/llm-tools/lm_cli.py /usr/local/bin/lm
    ```

4. In your Emacs configuration, add the following lines to install the `llm-tools.el` package using `straight-use-package`:

    ```elisp
    (straight-use-package '(llm-tools :type git :local-repo "/path/to/llm-tools"))
    (require 'llm-tools)
    ```
Replace `/path/to/llm-tools` with the actual path to your `llm-tools` directory.

Alternatively, you can load the `llm-tools.el` file directly:
    ```elisp
    (load-file "/path/to/llm-tools/llm-tools.el")
    ```

5. Restart Emacs to apply the changes.

## Usage

The `lm` command-line tool can be used to interact with the Claude API and manage chat histories. It supports a variety of commands such as starting a new chat, continuing an existing chat, reading chat history, undoing the last message, listing all current chat IDs, and deleting a chat. It can also generate shell commands and code in different programming languages.

The `call-claude` function provided by `llm-tools.el` can be used within Emacs to send text to the `lm` tool and display the result. This requires `lm` to be in your system's PATH.

## Future Work

The project aims to add more tools and agents to increase automation and make the tool more helpful for coding tasks.

## License

[MIT License](./LICENSE)