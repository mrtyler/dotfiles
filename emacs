;; -*-Mode: Emacs-Lisp;-*-
;; $Id: emacs,v 1.1 2003/10/24 01:37:46 tyler Exp $

;; Setup elisp paths
(setq load-path
      (append (list "~/lib/site-lisp"
		    "~/.elisp"
		    )
	      load-path))

;; General config
(setq make-backup-files nil
      require-final-newline 'ask
      version-control nil
      auto-save-default t
      auto-save-interval 50
      default-truncate-lines nil
      truncate-partial-width-windows default-truncate-lines
      scroll-step 1
      next-screen-context-lines 1
      compile-command "make"
      display-time-day-and-date t
      display-time-interval 60
      completion-ignored-extensions (append '(".tar"
					      ".gz"
					      ".tar.gz"
					      ".tar.Z"
					      ".tgz"
					      ".dvi"
					      ".ps"
					      ".o"
					      ".class"
					      ".mp3"
					      )
					    completion-ignored-extensions
					    )
      line-number-mode t
      ;; GNUS config
      gnus-select-method '(nntp "news.berkeley.edu")
      )

(resize-minibuffer-mode)
(display-time)
(server-start)

;; The following specifies what major mode to run based on the 
;; extension of the file you are loading/creating.

;; removed html-helper mode, cuz i don't got it here.

(setq auto-mode-alist
      (append
       '((".emacs.local$" . emacs-lisp-mode)
         (".emacs.highlight$" . emacs-lisp-mode)
         ("GNUmakefile$" . makefile-mode)
         ("\\.H$" . c-mode)
         ("\\.h$" . c-mode)
         ("\\.java$" . java-mode)
         ("\\.pl$" . perl-mode)
         ("\\.login$" . shell-script-mode)
	 ("\\.l$" . c++-mode)
	 ("\\.y$" . c++-mode)
	 ("\\.py$" . python-mode)
	 )
       auto-mode-alist)
      )

;; Function Definitions
(defun confirm-ps-print-buffer ()
  "Confirm print"
  (interactive)
  (if (yes-or-no-p "Are you sure you would like to print this document? ")
      (ps-print-buffer)
    (message "Print aborted")
    )
  )

(defun bye-bye ()
  "Confirm exit"
  (interactive)
  (if (yes-or-no-p "Are you crazy? ")
      (save-buffers-kill-emacs)
    (message "Quit aborted")
    )
  )

(defun uncomment-region (beg end &optional arg)
  "Uncomment a region"
  (interactive "r\nP")
  (comment-region beg end (- (length comment-start)))
  )

(defun indent-buffer()
  (interactive)
  (save-excursion
    (set-mark (point-min))
    (goto-char (point-max))
    (call-interactively 'indent-region))
  )


;; Key bindings
(global-set-key "\C-xc" 'compile)
(global-set-key "\C-s" 'isearch-forward)
(global-set-key "\C-xg" 'goto-line)
(global-set-key "\C-xp" 'confirm-ps-print-buffer)
(global-set-key "\C-x\C-l" 'load-file)
(global-set-key "\^M" 'newline-and-indent)
(global-set-key "\C-x\C-c" 'bye-bye)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\C-c\C-u" 'uncomment-region)
(global-set-key "\M-q" 'fill-paragraph)
(global-set-key "\C-x\C-n" 'rename-buffer)
(global-set-key "\M-%" 'query-replace-regexp)
(global-set-key "\M-g" 'goto-line)

;; Syntax coloring
(require 'font-lock)
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

;; Perl mode stuff
(require 'perl-mode)
(setq perl-tab-always-indent t)

;; C mode stuff
(require 'c-mode)
;(c-set-style "K&R")
(setq c-basic-offset 4)
(setq c-indent-level 4)
(setq c-brace-imaginary-offset 0)
(setq c-brace-offset -4)
(setq c-argdecl-indent 4)
(setq c-label-offset -4)
(setq c-continued-statement-offset 4)
(setq indent-tabs-mode nil)
(setq tab-width 4)

; (setq c-tab-always-indent t
;       c-indent-level 4
;      c-continued-statement-offset 4
;       c-argdecl-indent 0
; )

;; CC mode stuff
(require 'cc-mode)
(c-set-style "K&R")
(setq c-basic-offset 4)
(setq c-indent-level 4)
(setq c-brace-imaginary-offset 0)
(setq c-brace-offset -4)
(setq c-argdecl-indent 4)
(setq c-label-offset -4)
(setq c-continued-statement-offset 4)
(setq indent-tabs-mode nil)
(setq tab-width 4)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'flyspell-mode)

(custom-set-variables
 '(c-basic-offset 4)
 '(default-major-mode (quote text-mode))
 '(require-final-newline nil))

(add-hook 'java-mode-hook 'my-java-mode-hook)

(defun my-java-mode-hook ()
  (if (null window-system)
      ()
    ;;(setq c-basic-offset 2)
    (require 'andersl-java-font-lock)
    (turn-on-font-lock)))

(setq transient-mark-mode t)
(setq next-line-add-newlines nil)

;; this is the reverse of normal bindings, but
;; matches better how i want tags to work
(global-set-key "\M-." 'find-tag-other-window)
(global-set-key "\C-x4." 'find-tag)
