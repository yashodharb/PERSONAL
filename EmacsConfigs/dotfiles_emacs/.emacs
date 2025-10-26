;;; -*- lexical-binding: t -*-

(setq custom-file "~/.emacs.custom.el" )

(load-file "~/.emacs.custom.el")

;; Package Manager Configuration
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Ensure `use-package` is installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'yasnippet)      ;; load yasnippet
(yas-global-mode 1)        ;; enable yasnippet globally

;; Ibuffer Customization
;;(use-package ibuffer
;;  :ensure t
;;  :bind ("C-x C-b" . ibuffer)) ;; Replace default buffer list with ibuffer

;; UI Customizations
(menu-bar-mode -1) ;; Remove menu bar
(tool-bar-mode -1) ;; Remove tool bar
(scroll-bar-mode -1) ;; Remove scroll bar
(setq inhibit-startup-screen t) ;; Disable startup screen
(setq-default indent-tabs-mode nil  ;; Use spaces instead of tabs globally
              tab-width 4)          ;; Set global tab width to 4 spaces
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t) ;; Enable relative line numbers


;;(setq whitespace-style '(face tabs spaces trailing space-mark tab-mark))
;;(global-whitespace-mode 1)

(require 'whitespace)
(setq whitespace-style '(face spaces tabs newline space-mark tab-mark))
(setq whitespace-display-mappings
      '((space-mark   ?\    [?\u00B7]  [?.])    ;; middle dot for space
        (newline-mark ?\n   [?$ ?\n])
        (tab-mark     ?\t   [?\u2192 ?\t] [?> ?\t]))) ;; arrow for tab
(set-face-attribute 'whitespace-space nil :foreground "gray40" :background nil)
(set-face-attribute 'whitespace-newline nil :foreground "gray40" :background nil)
(set-face-attribute 'whitespace-tab nil :foreground "gray40" :background nil)
(global-whitespace-mode 1)

;; Case-insensitive search
(setq-default case-fold-search t)

;; Case-insensitive completion for file names, buffers, etc.
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq completion-ignore-case t)

;; Disable Arrow Keys with Guidance
(global-set-key (kbd "<up>")
                (lambda () (interactive) (message "Use C-p instead of the up arrow key!")))
(global-set-key (kbd "<down>")
                (lambda () (interactive) (message "Use C-n instead of the down arrow key!")))
(global-set-key (kbd "<left>")
                (lambda () (interactive) (message "Use C-b instead of the left arrow key!")))
(global-set-key (kbd "<right>")
                (lambda () (interactive) (message "Use C-f instead of the right arrow key!")))

;; Fullscreen on Startup
(add-to-list 'default-frame-alist '(fullscreen . fullboth)) ;; Launch Emacs in fullscreen mode

;; Enhanced and Smaller Mode Line
(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                "%b"                        ;; Buffer name
                "   %l:%c"                   ;; Line and column
                "   %I"                      ;; Buffer size
                "   %m"                      ;; Major mode
                (:eval (unless (string= (symbol-name buffer-file-coding-system) "utf-8-unix")
                         (concat " · " (symbol-name buffer-file-coding-system)))) ;; Show encoding if not UTF-8
                mode-line-modes))            ;; Minor modes


;; Set DejaVu Sans Mono Font
(set-face-attribute 'default nil
                    :family "JetBrainsMono Nerd Font" ;; Set font to DejaVu Sans Mono, a widely available font
                    :height 170)              ;; Set font size to 200%

;; Remove default scratch buffer message
(setq initial-scratch-message nil)


(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))

(use-package lsp-mode
  :ensure t
  :hook ((c-mode c++-mode) . lsp)
  :commands lsp
  :config
  ;; Disable features we don't need
  (setq lsp-enable-symbol-highlighting nil
        lsp-enable-on-type-formatting nil
        lsp-signature-auto-activate nil
        lsp-diagnostics-provider :none   ;; ← disables error checking
        lsp-enable-folding nil
        lsp-enable-links nil
        ;; Disable breadcrumb headerline
        lsp-headerline-breadcrumb-enable nil))




(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config
  ;; Disable UI extras (docs, sideline, etc.)
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil))



;; Disable the debuginfod prompt completely
(setenv "DEBUGINFOD_URLS" "")
(setq gdb-command-name "gdb -q -iex 'set debuginfod enabled off'")

;; Optional: enable GDB multi-window mode for a nice UI
(setq gdb-many-windows t
      gdb-show-main t)

;; Enable icomplete-mode for minibuffer autocomplete
(icomplete-mode 1)


