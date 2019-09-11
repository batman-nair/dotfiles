;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-buffer-choice (quote shell))
 '(package-selected-packages (quote (telephone-line undo-tree evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Manually installed packages go here
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Enable cmake-mode
(require 'cmake-mode)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
(define-key evil-normal-state-map "\C-w" 'evil-delete-backward-word)
(define-key evil-insert-state-map "\C-w" 'evil-delete-backward-word)
(define-key evil-visual-state-map "\C-w" 'evil-delete-backward-word)
(define-key evil-normal-state-map (kbd "C-.") 'undo-tree-redo)
(define-key evil-insert-state-map (kbd "C-.") 'undo-tree-redo)
(define-key evil-visual-state-map (kbd "C-.") 'undo-tree-redo)
