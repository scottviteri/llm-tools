;; llm-tools.el
;;
;; This script provides a function `call-claude` to interact with the "Claude"
;; AI model via a shell script (lm.py). It allows for sending a region of text
;; or a custom string to the AI model, and then inserting the output at various
;; locations in the buffer.

(defun call-claude ()
  "Function to interact with the Claude AI model."
  (interactive)
  
  ;; Collect the region of text if one is selected.
  (let* ((region (if (use-region-p)
                     (buffer-substring-no-properties (region-beginning) (region-end))
                   ""))  ;; If not, default to an empty string.
         
         ;; Prompt the user for any string they wish to prepend to the input.
         (prepend (read-string "Enter the string to prepend (or leave empty): "))
         
         ;; Prompt the user for any flags they wish to include in the command.
         (flags (read-string "Enter any flags for the Claude script: "))
         
         ;; Quote the input string to make it safe for shell command execution.
         (input (shell-quote-argument (concat prepend " " region)))
         
         ;; Prepare a new buffer to hold the output from the shell command.
         (output-buffer (generate-new-buffer "*claude-output*"))
         
         ;; Formulate the shell command that will be sent to Claude.
         (command (concat "/home/scottviteri/Scripts/c " flags " --message \"" input "\""))
         
         ;; Define the possible output locations for the response from Claude.
         (output-locations '("replace" "append" "new line" "minibuffer" "kill ring"))
         
         ;; Prompt the user for the desired output location.
         (output-location (completing-read "Where do you want to put the output? " output-locations nil t)))
    
    ;; Print the command to the minibuffer for user's information.
    (message command)
    
    ;; Execute the shell command and store the output in the prepared buffer.
    (shell-command command output-buffer)
    
    ;; Extract the output from the buffer.
    (let ((output (with-current-buffer output-buffer (buffer-string))))
      
      ;; Determine where to put the output based on the user's selection.
      (cond ((string= output-location "replace")
             (delete-region (region-beginning) (region-end))
             (insert output))
            ((string= output-location "append")
             (goto-char (region-end))
             (insert output))
            ((string= output-location "new line")
             (goto-char (point-max))
             (insert "\n")
             (insert output))
            ((string= output-location "minibuffer")
             (message "Output: %s" output))
            ((string= output-location "kill ring")
             (kill-new output))
            (t (message "Invalid output location. Output is: %s" output))))
    
    ;; Clean up by killing the output buffer.
    (kill-buffer output-buffer)))

