;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(add-to-list 'package-archives
             '("MELPA" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-buffer-choice (quote shell))
 '(package-selected-packages
   (quote
    (ace-jump-mode evil-visualstar evil-goggles grip-mode company cmake-mode markdown-mode flycheck evil-surround magit telephone-line undo-tree evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Manually installed packages go here
(add-to-list 'load-path "~/.emacs.d/lisp/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs Look & Feel
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Save session when closing and don't lock
;; (desktop-save-mode 1)
;; (setq desktop-load-locked-desktop t)

;; Move between windows using M-[ijkl]
(global-set-key (kbd "M-j")  'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-i")    'windmove-up)
(global-set-key (kbd "M-k")  'windmove-down)

;; Set default shell as bash, zsh causes weird prompts
(setq-default shell-file-name "/bin/bash")

;; Delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)

;; Reducing emacs font size
(set-frame-font
 "-CYRE-Inconsolata-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")

;; Change location of temp files
(setq auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "auto-save/") t)))

;; Find files at point
(global-set-key (kbd "C-S-f")  'find-file-at-point)
(global-set-key (kbd "C-x C-S-f")  'find-file-at-point)

;; (require 'powerline)
;; (powerline-default-theme)
(require 'telephone-line)
(telephone-line-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; eVIl Mode Activated
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'evil)
(evil-mode 1)

;; (global-linum-mode 'relative)

;; Evil mode rebinds
(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-a" 'move-beginning-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-motion-state-map "\C-e" 'end-of-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-w" 'evil-delete-backward-word)
(define-key evil-insert-state-map "\C-w" 'evil-delete-backward-word)
(define-key evil-visual-state-map "\C-w" 'evil-delete-backward-word)
(define-key evil-normal-state-map (kbd "C-.") 'undo-tree-redo)
(define-key evil-insert-state-map (kbd "C-.") 'undo-tree-redo)
(define-key evil-visual-state-map (kbd "C-.") 'undo-tree-redo)

;; Vim Surround
(require 'evil-surround)
(global-evil-surround-mode 1)

;; Highlight changes in evil mode
(evil-goggles-mode)
;; Search for visual selection with */#
(global-evil-visualstar-mode)

;; Quick jump to anywhere in the window
(require 'ace-jump-mode)
(define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ediff Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-library "ediff")
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; Return to previous window config on quit
(winner-mode)
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)

;; Add jk movement in ediff
(defun ora-ediff-hook ()
  (ediff-setup-keymap)
  (define-key ediff-mode-map "j" 'ediff-next-difference)
  (define-key ediff-mode-map "k" 'ediff-previous-difference))
(add-hook 'ediff-mode-hook 'ora-ediff-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x g") 'magit-status)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IDE Features
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(with-eval-after-load 'flycheck
  (setq-default flycheck-disabled-checkers '(emacs-lisp emacs-lisp-checkdoc)))

;; cmake-ide setup
(cmake-ide-setup)

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; Compilation Shortcut
(global-set-key (kbd "C-x C-e")  'compile)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org-Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-agenda-files (quote ("~/org/todo.org")))

(setq org-todo-keywords
  '((sequence "TODO(t)" "WORKING(w)" "|" "DONE(d)" "STASHED(s)")))
(setq org-todo-keyword-faces
      '(("WORKING" . "orange")
	("DONE" . "forest green")
	("STASHED" . "grey")))

(setq org-default-notes-file "~/org/todo.org")
(setq org-capture-templates
      '(("t" "Todo" entry
	 (file+headline "~/org/todo.org" "General Tasks")
	 "* TODO %i%?\n")
	("l" "Todo with link" entry
	 (file+headline "~/org/todo.org" "General Tasks")
	 "* TODO %i%?\n%a")
	("s" "Tasks done someday" entry
	 (file+headline "~/org/todo.org" "Someday sometime")
	 "* STASHED %i%?\n")
	("n" "Note" entry
	 (file+headline "~/org/todo.org" "Notes")
	 "* %i%?\n")
	("i" "Idea" entry
	 (file+headline "~/org/todo.org" "Random Ideas")
	 "* %i%?\n")))

(setq org-use-fast-todo-selection t)
(setq org-enforce-todo-dependencies t)
(setq org-cycle-separator-lines -1)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key (kbd "C-c c")  'org-capture)
