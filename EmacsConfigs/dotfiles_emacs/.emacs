;;; -*- lexical-binding: t -*-

(setq custom-file "~/.emacs.custom.el")
(load-file "~/.emacs.custom.el")

;; ---------------------------------------------------------------------------
;; Package Manager Configuration
;; ---------------------------------------------------------------------------

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; ---------------------------------------------------------------------------
;; Package Refresh
;; ---------------------------------------------------------------------------

(unless package-archive-contents
  (package-refresh-contents))

;; ---------------------------------------------------------------------------
;; Ensure `use-package` is installed
;; ---------------------------------------------------------------------------

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; ---------------------------------------------------------------------------
;; Yasnippet
;; ---------------------------------------------------------------------------

(use-package yasnippet
  :config
  (yas-global-mode 1))

;; ---------------------------------------------------------------------------
;; DISABLE AUTOSAVE, BACKUPFILES AND LOCKFILES
;; ---------------------------------------------------------------------------

(setq auto-save-default nil)
(setq make-backup-files nil)
(setq create-lockfiles nil)

;; ---------------------------------------------------------------------------
;; UI Customizations
;; ---------------------------------------------------------------------------

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(setq-default indent-tabs-mode nil tab-width 4)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; ---------------------------------------------------------------------------
;; C/C++ indentation settings
;; ---------------------------------------------------------------------------

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            (setq c-basic-offset 4)))

;; ---------------------------------------------------------------------------
;; Generic indentation (Python, JS, etc.)
;; ---------------------------------------------------------------------------

(add-hook 'prog-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)))

;; ---------------------------------------------------------------------------
;; Whitespace settings
;; ---------------------------------------------------------------------------

(require 'whitespace)
(setq whitespace-style '(face spaces tabs newline space-mark tab-mark))
(setq whitespace-display-mappings
      '((space-mark   ?\    [?\u00B7]  [?.])
        (newline-mark ?\n   [?$ ?\n])
        (tab-mark     ?\t   [?\u2192 ?\t] [?> ?\t])))
(set-face-attribute 'whitespace-space nil :foreground "gray40" :background nil)
(set-face-attribute 'whitespace-newline nil :foreground "gray40" :background nil)
(set-face-attribute 'whitespace-tab nil :foreground "gray40" :background nil)
(global-whitespace-mode 1)

;; ---------------------------------------------------------------------------
;; Case-insensitive search and completion
;; ---------------------------------------------------------------------------

(setq-default case-fold-search t)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq completion-ignore-case t)

;; ---------------------------------------------------------------------------
;; Disable Arrow Keys with Guidance
;; ---------------------------------------------------------------------------

(global-set-key (kbd "<up>")    (lambda () (interactive) (message "Use C-p instead of ↑")))
(global-set-key (kbd "<down>")  (lambda () (interactive) (message "Use C-n instead of ↓")))
(global-set-key (kbd "<left>")  (lambda () (interactive) (message "Use C-b instead of ←")))
(global-set-key (kbd "<right>") (lambda () (interactive) (message "Use C-f instead of →")))

;; ---------------------------------------------------------------------------
;; Fullscreen on Startup
;; ---------------------------------------------------------------------------

(add-to-list 'default-frame-alist '(fullscreen . fullboth))

;; ---------------------------------------------------------------------------
;; Simplified Mode Line
;; ---------------------------------------------------------------------------

(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                "%b"
                "   %l:%c"
                "   %I"
                "   %m"
                (:eval (unless (string= (symbol-name buffer-file-coding-system) "utf-8-unix")
                         (concat " � " (symbol-name buffer-file-coding-system))))
                mode-line-modes))

;; ---------------------------------------------------------------------------
;; Font
;; ---------------------------------------------------------------------------

(set-face-attribute 'default nil
                    :family "JetBrainsMono Nerd Font"
                    :height 170)

;; ---------------------------------------------------------------------------
;; Remove default scratch buffer message
;; ---------------------------------------------------------------------------

(setq initial-scratch-message nil)

;; ---------------------------------------------------------------------------
;; Python & Rust support
;; ---------------------------------------------------------------------------

(use-package python-mode :defer t)
(use-package rust-mode :defer t)

;; ---------------------------------------------------------------------------
;; Multiple Cursors
;; ---------------------------------------------------------------------------

(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-S-c C-S-c" . mc/edit-lines)))

;; ---------------------------------------------------------------------------
;; Corfu (completion UI)
;; ---------------------------------------------------------------------------

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.1)
  (corfu-auto-prefix 1)
  (corfu-preview-current nil)
  (corfu-min-width 25)
  (corfu-max-width 80)
  (corfu-count 14)
  (corfu-scroll-margin 4)
  :init
  (global-corfu-mode))

(with-eval-after-load 'corfu
  (require 'corfu-popupinfo)
  (setq corfu-popupinfo-delay 0.5)
  (corfu-popupinfo-mode))

;; ---------------------------------------------------------------------------
;; Vertico + Orderless (Better Completion)
;; ---------------------------------------------------------------------------

(use-package vertico
  :init (vertico-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; ---------------------------------------------------------------------------
;; Save-hist (remember minibuffer history)
;; ---------------------------------------------------------------------------

(use-package savehist
  :init (savehist-mode))

;; ---------------------------------------------------------------------------
;; LSP Configuration
;; ---------------------------------------------------------------------------

(use-package lsp-mode
  :hook ((c-mode c++-mode rust-mode) . lsp)
  :commands lsp
  :custom
  (lsp-completion-provider :none)
  (lsp-enable-symbol-highlighting nil)
  (lsp-enable-on-type-formatting nil)
  (lsp-signature-auto-activate nil)
  (lsp-diagnostics-provider :none)
  (lsp-enable-folding nil)
  (lsp-enable-links nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-enable-indentation nil)
  (lsp-enable-on-type-formatting nil))

(setq lsp-auto-guess-root t)

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil))

;; ---------------------------------------------------------------------------
;; GDB Config
;; ---------------------------------------------------------------------------

(setenv "DEBUGINFOD_URLS" "")
(setq gdb-command-name "gdb -q -iex 'set debuginfod enabled off'")
(setq gdb-many-windows t
      gdb-show-main t)

;; ---------------------------------------------------------------------------
;; icomplete for minibuffer autocomplete
;; ---------------------------------------------------------------------------

(icomplete-mode 1)

;; ---------------------------------------------------------------------------
;; Performance Optimizations
;; ---------------------------------------------------------------------------

(setq gc-cons-threshold (* 128 1024 1024))  ;; 128MB before GC
(setq read-process-output-max (* 4 1024 1024))  ;; 4MB for LSP data
(setq idle-update-delay 0.5)
(setq fast-but-imprecise-scrolling t)
(setq redisplay-skip-fontification-on-input t)
(setq jit-lock-defer-time 0)
(setq inhibit-compacting-font-caches t)

;; Enable native-comp (faster Lisp)
(when (boundp 'native-comp-async-report-warnings-errors)
  (setq native-comp-async-report-warnings-errors nil))
