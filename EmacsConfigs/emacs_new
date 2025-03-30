;;; -*- lexical-binding: t -*-

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

;; Theme Settings - Gruber-Darker Theme
(use-package gruber-darker-theme
  :ensure t
  :config
  (load-theme 'gruber-darker t)) ;; Load Gruber-Darker theme

(setq initial-scratch-message nil) ;; Remove default scratch buffer message

;; Enable icomplete-mode for minibuffer autocomplete
(icomplete-mode 1)

;; Scrolling Configuration
(setq mouse-wheel-progressive-speed nil) ;; Disable accelerated scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; Smooth scrolling, one line per wheel tick
(setq scroll-conservatively 101) ;; Prevent recentering while scrolling
(setq scroll-step 1) ;; Scroll by one line at a time
(setq auto-window-vscroll nil) ;; Disable automatic vertical scroll adjustments
(setq pixel-scroll-mode nil) ;; Ensure pixel scrolling is off
(setq fast-but-imprecise-scrolling t) ;; Optimize for immediate feedback while scrolling

;; Essential Packages
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0) ;; Enable autocompletion immediately
  (setq company-backends '(company-capf company-dabbrev company-files))) ;; Exclude company-clang

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)) ;; Enable syntax checking globally

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'") ;; JavaScript mode for .js files

(use-package prettier-js
  :ensure t
  :hook (js2-mode . prettier-js-mode)) ;; Enable Prettier for JavaScript formatting

(use-package clang-format
  :ensure t) ;; Clang-format integration for C/C++ formatting

;; Visual Indentation Guides with a Vertical Bar
(use-package highlight-indent-guides
  :ensure t
  :hook (prog-mode . highlight-indent-guides-mode) ;; Enable in programming modes
  :config
  (setq highlight-indent-guides-method 'character   ;; Use characters for indentation
        highlight-indent-guides-character ?│        ;; Use a vertical bar as the guide character
        highlight-indent-guides-auto-enabled nil    ;; Avoid automatic calculations
        highlight-indent-guides-responsive 'top     ;; Highlight active indentation region
        highlight-indent-guides-delay 0.1))         ;; Slight delay for performance

;; Ibuffer Customization
(use-package ibuffer
  :ensure t
  :bind ("C-x C-b" . ibuffer)) ;; Replace default buffer list with ibuffer

;; UI Customizations
(menu-bar-mode -1) ;; Remove menu bar
(tool-bar-mode -1) ;; Remove tool bar
(scroll-bar-mode -1) ;; Remove scroll bar
(setq inhibit-startup-screen t) ;; Disable startup screen
(setq-default indent-tabs-mode t
              tab-width 4) ;; Use tabs for indentation
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t) ;; Enable relative line numbers

;; Ensure pressing TAB inserts a real tab character
(setq-default indent-tabs-mode t) ;; Use tabs instead of spaces
(setq-default tab-width 4) ;; Set tab width to 4 spaces

;; Make sure TAB key behaves as expected in all major modes
(global-set-key (kbd "TAB") 'self-insert-command)

;; Prevent company-mode from overriding TAB for completion if needed
(with-eval-after-load 'company
  (define-key company-active-map (kbd "TAB") nil)
  (define-key company-active-map (kbd "<tab>") nil))

;; Ensure that electric-indent-mode does not interfere with tabs
(setq electric-indent-mode nil)

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

;; Enhanced and Smaller Mode Line (No Icons)
(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                "Buffer: %b (%n) | " ;; Display buffer name and buffer number
                "Position: %l:%c | " ;; Display line and column
                "Size: %I | " ;; Display buffer size
                "Mode: %m | " ;; Display major mode
                "Time: " (:eval (format-time-string "%H:%M")) " | " ;; Display current time
                "Progress: %p%% | " ;; Display percentage through the file
                "Encoding: " (:eval (symbol-name buffer-file-coding-system)) ;; Display encoding info
                " | "
                mode-line-modes)) ;; Show major/minor modes

;; Set Smaller Font Size for Mode Line
(set-face-attribute 'mode-line nil :height 130)
(set-face-attribute 'mode-line-inactive nil :height 130)

;; Set DejaVu Sans Mono Font
(set-face-attribute 'default nil
                    :family "DejaVu Sans Mono" ;; Set font to DejaVu Sans Mono, a widely available font
                    :height 200)              ;; Set font size to 200%

;; Kill All Buffers Function
(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (switch-to-buffer "*scratch*"))

(custom-set-variables)
(custom-set-faces
 '(cursor ((t (:background "dark gray"))))
 '(dired-directory ((t (:foreground "yellow" :weight bold))))
 '(font-lock-comment-delimiter-face ((t (:foreground "white"))))
 '(font-lock-comment-face ((t (:foreground "white"))))
 '(font-lock-variable-name-face ((t (:foreground "spring green"))))
 '(line-number-current-line ((t (:inherit line-number :foreground "yellow" :weight bold))))
 '(mode-line ((t (:background "dark gray" :foreground "black" :weight normal :height 150))))
 '(mode-line-inactive ((t (:background "light gray" :foreground "black" :box (:line-width (3 . 3) :color "light gray" :style flat-button) :weight normal :height 130)))))
