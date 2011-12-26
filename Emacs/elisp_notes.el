;; @author : Wojciech Jedynak (wjedynak@gmail.com)
;; @date   : 2011-08-28
;; @tags   : elisp ; notes
;; @short  : Sample elisp functions and notes


(+ 1 2 3 4)

(message "Hello!")
(message "The result is %d" (* 7 5))

(message-box "Hello in a box!")

(current-buffer)
(other-buffer)

(get-buffer "tests.el")
(get-buffer-create "tralala")
(kill-buffer "tralala")

(generate-new-buffer-name "*scratch*")

(buffer-name)
(buffer-file-name)

(rename-buffer "testssss.el")
(rename-buffer "notes.el")

;; In the *scratch* buffer one can use C-u C-x C-e to evaluate the last S-expr *and* insert the result at current point

;; switch to the other buffer even if it's visible
(switch-to-buffer (other-buffer (current-buffer) t))

;; change work-buffer without changing the buffer in the current window
(set-buffer)

(buffer-size)
(point)

(point-min)
(point-max)
    
;; bind a key
(global-set-key "\C-cw" 'compare-windows)

;; unbind a key
(global-unset-key "\C-xf")


(set-mark-command)

(center-region)
(count-lines-region)
(kill-region)

;; some library functions

equal
eq
; Test whether two objects are the same. equal uses one meaning of the word `same' and eq uses another: 
; equal returns true if the two objects have a similar structure and contents, such as two copies of the same book. 
; On the other hand, eq, returns true if both arguments are actually the same object.
string<
string-lessp
string=
string-equal
; The string-lessp function tests whether its first argument is smaller than the second argument. 
; A shorter, alternative name for the same function (a defalias) is string<.

;; The arguments to string-lessp must be strings or symbols; the ordering is lexicographic, so case is significant. 
;; The print names of symbols are used instead of the symbols themselves.

;; An empty string, ‘""’, a string with no characters in it, is smaller than any string of characters.

;; string-equal provides the corresponding test for equality. Its shorter, alternative name is string=. 
;; There are no string test functions that correspond to >, >=, or <=. 

;; the body of a beginning-of-buffer function
(push-mark)
(goto-char (point-min))

(find-file "tests.el")

;; marks the current buffer as current and evaluates body - restores current buffer afterwards
(with-current-buffer (buffer-name)
  (body...))

(barf-if-buffer-read-only)

;; erase current buffer
(erase-buffer)

(copy-to-buffer "copy" (point-min) (point-max))

(append-to-buffer)

(let (start 
      end)
  (with-current-buffer (get-buffer "*scratch*")
    (setq start (point-min))
    (setq end   (point-max)))                      
  (insert-buffer-substring "*scratch*" start end)) 

(bufferp (get-buffer "notes.el"))


;; lists
(nthcdr 3 '(1 2 3 4 5)) ;; (4 5)

(nth 3 '(1 2 3 4 5)) ;; 4

(setq letters '(a b c d))
(setcar letters 'z)
(setcdr letters '(1 2 3))
letters

(sentence-end)

(require 'cl)

(emacs-version)
emacs-major-version



;; simple test
(if (< emacs-major-version 23)
    1                                   ; insert comment
  2)

M-; insert comment
C-u M-;     kill comment on cur line
      ;
      ;
      ;
      ;
      ;
      ;
      ;
      ;
      ; this is tralala
      ; and i will ...
C-x ;  set comment col
M-j ; start new line with a comment

;;  For C-like modes, you can configure the exact effect of `M-;' by
;; setting the variables `c-indent-comment-alist' and
;; `c-indent-comments-syntactically-p'.  For example, on a line ending in
;; a closing brace, `M-;' puts the comment one space after the brace
;; r

;; Some Lisp dialects have “closures,” objects that are like functions
;; but record additional variable bindings. Emacs Lisp does not have closures.

;; The actual implementation of variable scoping in GNU Emacs Lisp uses
;; a technique called shallow binding. Each variable has a standard place
;; in which its current value is always found—the value cell of the symbol.

;; auto-load example
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))

;; The first line -*- mode: xx -*- is a quick way to tell emacs
;;  to load “xx-mode” when the file is opened. This way,
;;  we don't have to manually call “xx-mode” each time we open the test file.