;; @author : Wojciech Jedynak (wjedynak@gmail.com)
;; @date   : 2011-08-28 ; 2011-12-27
;; @tags   : elisp ; notes
;; @short  : Sample elisp functions and notes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] emacs version
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

emacs-major-version                     ; 23
emacs-minor-version                     ; 1
emacs-version                           ; "23.1.1"
(emacs-version)                         ; full info

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] booleans
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; same stuff
()
nil
'nil

(booleanp 10)                           ; nil
(booleanp t)
(booleanp nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] types and checking them
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; returns the primitive type
(type-of 1)                      ; integer
(type-of 1.0)                    ; float

(type-of "a")                    ; string
(type-of '(a))                   ; cons
(type-of [])                     ; vector
(type-of (make-hash-table))      ; hash-table
(type-of (make-bool-vector 3 t)) ; bool-vector
(type-of (symbol-function 'car)) ; subr
(type-of (symbol-function 'count-lines)) ; compiled-function
(type-of (current-buffer))       ; buffer
(type-of 'a)                     ; symbol
(type-of nil)                    ; symbol
(type-of ())                     ; symbol
(type-of t)                      ; symbol

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] symbols
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(equal (make-symbol "foo") 'foo)    ;nil
(eq    (make-symbol "foo") 'foo)    ;nil
(eq 'foo 'foo)                   ;t


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] unstructured
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(cons 'a 'b)

; (this is)

[(numberp 123)]                         ; not evaluated!


;;; primitive functions
(symbol-function 'car)                  ;#<subr car>
(subrp (symbol-function 'car))          ;t 

;;; markers
(point-marker)

(selected-window)
(selected-frame)
(get-device-terminal nil)
(process-list)

fill-column                             ;70

self-insert-command

(require 'cl)

;; auto-load example
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))

;; today's date
(insert (format-time-string "%Y-%m-%d"))

;; line information
(count-lines (point-min) (point-max))
(what-line)

;; char-table
(char-table-p obj)
;; OBSOLETE since 23.1 since Unicode in now the basis of internal representation
translation-table-for-input

(condition-case)
(unless)

(defvar)
(defcustom)

yank
yank-pop
yank-rotate
kill-ring
kill-ring-yank-pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] numbers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; elisp uses fixed precision integers
5000000000000000000000 ; -1
most-positive-fixnum ;; 1 152 921 504 606 846 975
most-negative-fixnum
(log most-positive-fixnum 2)            ; 60
(max-char)         ;; 4194303 (#o17777777, #x3fffff)

(random 100)

(numberp 100)
(numberp "123")

(integerp 100)                          ; t
(integerp 10.0)                         ; nil

(floatp 10.0)                   ; t
(floatp 1100)                   ; false

(log 100 10)                    ; 2.0
(log e)                         ; default base is e

(mod 100 3)
(% 100 3)
(/ 100 3)

(round 2.5)                             ;2
(ceiling 2.6)                           ; 3

(string-to-number "12")                 ; 12
(string-to-number "12.0")               ; 12.0


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] control structures
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(let ((i 10)
      (acc 0))
  (while (< 0 i)
    (setq acc (+ acc i))
    (setq i (1- i)))
  acc)

(let ((l '(1 2 3 4 5))
      (result 0))
  (dolist (a l result)
    (incf result a)))

(let (result)
  (dotimes (i 10 result)
    (push i result)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] Emacs lisp is a lisp-2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun hello ()
  (message "Hello!"))

(setq hello 123)

hello
(hello)

;; those two definitions live in two diffenent worlds

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(find-file "tests.el")
(find-file-noselect "tests.el")

(directory-files "/home/wjzz" nil "\\.hs$")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] regions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(center-region)
(count-lines-region)
(kill-region)

(region-beginning)
(region-end)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] buffers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; buffer info

(buffer-size)
(barf-if-buffer-read-only)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; buffer name handling

(buffer-name)
(buffer-file-name)                      ; full name

(generate-new-buffer-name "*scratch*")

(rename-buffer "testssss.el")
(rename-buffer "notes.el")

;; buffers themselves
(current-buffer)
(other-buffer)
(bufferp (get-buffer "notes.el"))

;; finding a buffer
(get-buffer "tests.el")
(get-buffer-create "tralala")

;; kill a buffer
(kill-buffer "tralala")

;;;;;;;;;;;;;;;;;;;;;;;;;
;; switch buffer

;; This will visually switch to the last NON-VISIBLE buffer
(switch-to-buffer (other-buffer))

;; Use this to switch to the last buffer
(switch-to-buffer (other-buffer (current-buffer) t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; buffer contents manipulation

(insert "hello")
(erase-buffer)
(copy-to-buffer "copy" (point-min) (point-max))
(append-to-buffer)


;; Substring
(insert-buffer-substring "*scratch*" start end))
(buffer-substring)
(buffer-substring-no-properties)
(filter-buffer-substring)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sandboxing buffer operations

;; marks the current buffer as current and evaluates body - restores current buffer afterwards
(with-current-buffer (buffer-name)
  (body...))

;; saves the current buffer, point and marks
(save-excursion 
  (set-buffer "*scratch*")
  (insert "hello"))


(save-restriction ...)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] narrowing
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(narrow-to-region start end)
(widen)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] points
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(point)
(point-min)                             ; 1
(point-max)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] marks
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(push-mark)
(set-mark-command)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] moving in the buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(progn
  (goto-char (point-min))
  (insert ";; hello\n"))

;; if argument is bigger than the number of lines in the file
;; then the number of lines left to move is returned
(forward-line 10)
(forward-line -2)                       ; go backwards
(forward-line)
(forward-sentence)
(forward-paragraph)

(beginning-of-line)
(end-of-line)

(sentence-end)

;; this will save point and mark
(save-excursion
  (goto-char (point-min))
  (insert ";; hello2\n\n"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] searching the buffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; finds the previous occurence of defun
;; -1 would match the defun arg in search-forward ;)
(search-forward "defun" nil nil -2)  

(search-forward "target-string"
                limit-of-search
                what-to-do-if-search-fails
                repeat-count)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] function definition 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun add-five (number)
  "Adds 5 to NUMBER.

100% pure function."
  (+ 5 number))

(defun double (number)
  "Doubles NUMBER."
  (interactive "nNumber: ")             ; prompt for a number
  (message "The double of %d is %d." number (+ number number)))

(defun wjzz-file (file)
  (interactive "f")                     ; prompt for a file
  (message "%s" file))

(defun wjzz-optional (&optional maybe)
  "With \\[universal-argument] prefix MAYBE"
  (interactive "P"))

;; Alternatively, if the special letter-codes are not right for your application, 
;; you can pass your own arguments to interactive as a list. 
;; See The Definition of append-to-buffer, for an example. 

(interactive
 (list (read-buffer "Append to buffer: " (other-buffer
                                          (current-buffer) t))
       (region-beginning) (region-end)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] prompts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(read-buffer "Buffer: ")
(read-string "String: ")

(prefix-numeric-value argument)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] comparisons
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; = allows int and float comparison,
;; 'equal' will always return nil when comparing ints with floats

(= 10 10.0)                             ; t
(equal 10 10.0)                         ; nil


(setq a '(1 2 3))
(setq b a)                              ; alias for a
(setq c '(1 2 3))

;; 'equal' compares structure
;; 'eq'    checks if given objects are exactly the same

(equal a c)                             ; t
(eq a c)                                ; nil
(eq a b)                                ; t 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] message formating
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "x = %d, y = %d" 123 303)

;; GTK box
(message-box "Hello in a box!")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] variable binding 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(set 'abc 123)
abc

(setq abcd 101)
abcd

(setq a 1
      b 2
      c)

(list a b c)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] chars
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

?a                                      ; 97
?\t
?\n                                     ; 10
?\C-x                                   ; C-x
?\M-x                                   ; M-x

;; get nth char
(char-to-string (aref "Hello" 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] strings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(substring "Hello, there!" 0 -1)        ; all but the last character

(number-to-string 1023)                 ; "1023"
(number-to-string 10.00)                ; "10.0"

(concat "Hello" ", " "there")

(string-equal "hello" "hello")          ; also string=
(string-lessp "hell" "hello")           ; also string<

(char-to-string 70)                     ; "F"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] lists
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq exlist '(1 2 3 4 5 6 7 8 9 10 11 12 13))

(setq funs '(first second third fourth fifth sixth seventh eighth ninth tenth))
;; there is no eleventh :-)

;; test all funs at once
(mapcar (lambda (f) (funcall f exlist)) funs)

(rest '())                              ; nil
(cdr '())                               ; nil

;; SAFE CDR
(cdr 123)                               ; error
(cdr-safe 123)                          ; nil!

(cons 'a '(b c d))

(nthcdr 3 '(1 2 3 4 5)) ;; (4 5)
(nth 3 '(1 2 3 4 5)) ;; 4

;; destructive update

(setq letters '(a b c d))
(setcar letters 'z)
(setcdr letters '(1 2 3))
letters

(sort '(1 10 2 15 3) '<)
(sort '("hello" "a" "bcd" "aaa") 'string<)

(reverse  '(a b c))
(nreverse '(a b c))                     ; destructive update

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] generic sequences
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(char-to-string (aref "abcd" 3))        ; "d"
(aref [a b c d] 3)            ; d

(length "abcd")
(length [a b c d])
(length '(a b c d))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
   
;; bind a key
(global-set-key "\C-cw" 'compare-windows)

;; unbind a key
(global-unset-key "\C-xf")

(define-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] scoping
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; the difference between lexical and dynamic scoping
;; lies in the closures (or the lack of them)

;; With lexical scoping closures need to be created,
;; so the values of free variables at the call time are the same
;; as at define time.

;; With dynamic scoping the name in scope is used.


;; The default: dynamic scoping

(defun get-x ()
  xx)

(get-x)                                 ; xx not defined
(setf xx 10)
(get-x)                                 ; 10
(setf xx 11)
(get-x)                                 ; 11

;; Lexical scoping

(lexical-let 
    ((yy 303))
  (defun get-y ()
    yy))

(get-y)                                 ; 303
(setq yy 123)
(get-y)                                 ; still 303


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] exceptions and errors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(error "BOOM")

(condition-case e
    (progn
      (error "BOOM")
      (message "Past error"))
  (error (concat "12" (error-message-string e))))
  
    

(catch 'found 
  (throw 'found 'not-local-exit))

(setq xxx 121)

(catch 'found
  (if (= xxx 12)
      (throw 'found 0)
    1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] debugging
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun factorial (n)
  ;; (debug)
  (if (zerop n)
      1
    (* n (factorial (1- n)))))

(factorial 10)

; M-x debug-on-entry
; M-x cancel-debug-on-entry
      


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; [] notes.el ends here
