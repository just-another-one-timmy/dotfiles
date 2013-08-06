;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen
(setq inhibit-startup-message t)

(global-linum-mode +1)
(column-number-mode +1)
(blink-cursor-mode 0)
(setq scroll-preserve-screen-position t)
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(load-theme 'whiteboard)

;; ido mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
; C-j allows to do the same.
; (setq ido-create-new-buffer 'always)

;;
;; ace jump mode major function
;; 
(add-to-list 'load-path "~/.emacs.d/ace-jump-mode")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; jump on buffers
(add-to-list 'load-path "~/.emacs.d/elpa/ace-jump-buffer-20130627.2104/")
(require 'ace-jump-buffer)
(global-set-key (kbd "C-x b") 'ace-jump-buffer)
(global-set-key (kbd "C-c C-x b") 'switch-to-buffer)
(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)
(global-set-key (kbd "C-c C-x C-b") 'list-buffers)

;; F11 for fullscreen.
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))
(global-set-key [f11] 'toggle-fullscreen)

(add-to-list 'default-frame-alist '(font . "Consolas-16"))
(set-default-font "Consolas-16")

;;
;; smex - ido in minibuffer
;;
(add-to-list 'load-path "~/.emacs.d/smex")
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;
;; emms - emacs multimedia system
;;
(add-to-list 'load-path "~/.emacs.d/emms/lisp")
(require 'emms-setup)
(emms-standard)
(emms-default-players)

;; company
(add-to-list 'load-path "~/.emacs.d/company-mode/")
(require 'company)
(global-company-mode t)

;; eclim - eclipse autocomplete and other stuff
(add-to-list 'load-path "~/.emacs.d/emacs-eclim/")
(require 'eclim)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-eclim-mode)

;; Melpa repository
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
