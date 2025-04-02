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

;; Theme Settings - Default Deeper-Blue Theme
(setq custom-enabled-themes '(deeper-blue)) ;; Set deeper-blue as the default theme
(load-theme 'deeper-blue t)                 ;; Load deeper-blue theme

;; Flycheck Configuration
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode) ;; Enable flycheck globally
  :config
  (setq flycheck-indication-mode 'right-fringe) ;; Display errors on the right fringe
  (setq flycheck-check-syntax-automatically '(save idle-change))
  (setq flycheck-idle-change-delay 2)) ;; Delay syntax checking when idle

;; Optional: Custom Flycheck Behavior for C
(add-hook 'c-mode-hook
          (lambda ()
            (setq flycheck-gcc-language-standard "c11") ;; Use C11 standard
            (setq flycheck-clang-language-standard "c11"))) ;; Apply for Clang as well

;; Scrolling Configuration
(setq mouse-wheel-progressive-speed nil) ;; Disable accelerated scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; Smooth scrolling, one line per wheel tick
(setq scroll-conservatively 101) ;; Prevent recentering while scrolling
(setq scroll-step 1) ;; Scroll by one line at a time
(setq auto-window-vscroll nil) ;; Disable automatic vertical scroll adjustments
(setq pixel-scroll-mode nil) ;; Ensure pixel scrolling is off
(setq fast-but-imprecise-scrolling t) ;; Optimize for immediate feedback while scrolling

;; Ibuffer Customization
(use-package ibuffer
  :ensure t
  :bind ("C-x C-b" . ibuffer)) ;; Replace default buffer list with ibuffer

;; UI Customizations
(menu-bar-mode -1) ;; Remove menu bar
(tool-bar-mode -1) ;; Remove tool bar
(scroll-bar-mode -1) ;; Remove scroll bar
(setq inhibit-startup-screen t) ;; Disable startup screen
(setq-default indent-tabs-mode nil  ;; Use spaces instead of tabs globally
              tab-width 4)          ;; Set global tab width to 4 spaces
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t) ;; Enable relative line numbers

;; Ensure Tab Inserts Four Spaces in All Modes
(defun enforce-indent-setup ()
  "Force Tab key to insert spaces and display consistent dots for indentation."
  (setq-local indent-tabs-mode nil) ;; Use spaces for indentation
  (setq-local tab-width 4)          ;; Set tab width to 4 spaces
  (local-set-key (kbd "TAB") 'indent-for-tab-command)) ;; Tab inserts spaces
(add-hook 'after-change-major-mode-hook 'enforce-indent-setup) ;; Apply to all modes

;; Enable c-mode for C files
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode)) ;; Ensure .c files use c-mode

;; Compile Shortcut
(defun my-compile ()
  "Compile the current C file."
  (interactive)
  (save-buffer)
  (let ((compile-command (concat "gcc -o " (file-name-sans-extension buffer-file-name) " " buffer-file-name)))
    (compile compile-command)))
(global-set-key (kbd "C-c C-c") 'my-compile) ;; Add a global compile shortcut

;; Display Dots for Indentation Using Whitespace Mode
(setq whitespace-style '(face spaces trailing lines-tail space-mark tab-mark))
(setq whitespace-display-mappings
      '((space-mark 32 [183] [46]) ;; Display spaces as centered dots
        (tab-mark 9 [183 9] [46 9]))) ;; Display tabs as dots, consistent with spaces
(add-hook 'c-mode-hook 'whitespace-mode) ;; Enable whitespace mode for c-mode

;; Disable Electric Indent Mode Globally
(electric-indent-mode -1)

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
                " · %l:%c"                   ;; Line and column
                " · %I"                      ;; Buffer size
                " · %m"                      ;; Major mode
                (:eval (unless (string= (symbol-name buffer-file-coding-system) "utf-8-unix")
                         (concat " · " (symbol-name buffer-file-coding-system)))) ;; Show encoding if not UTF-8
                mode-line-modes))            ;; Minor modes

;; Set Smaller Font Size for Mode Line
(set-face-attribute 'mode-line nil :height 130) ;; Reduce mode line font size
(set-face-attribute 'mode-line-inactive nil :height 130) ;; Reduce inactive mode line font size

;; Set DejaVu Sans Mono Font
(set-face-attribute 'default nil
                    :family "DejaVu Sans Mono" ;; Set font to DejaVu Sans Mono, a widely available font
                    :height 200)              ;; Set font size to 200%

;; Kill All Buffers Function
(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (switch-to-buffer "*scratch*"))

;; Remove default scratch buffer message
(setq initial-scratch-message nil)

;; Enable icomplete-mode for minibuffer autocomplete
(icomplete-mode 1)
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

;; Theme Settings - Default Deeper-Blue Theme
(setq custom-enabled-themes '(deeper-blue)) ;; Set deeper-blue as the default theme
(load-theme 'deeper-blue t)                 ;; Load deeper-blue theme

;; Flycheck Configuration
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode) ;; Enable flycheck globally
  :config
  (setq flycheck-indication-mode 'right-fringe) ;; Display errors on the right fringe
  (setq flycheck-check-syntax-automatically '(save idle-change))
  (setq flycheck-idle-change-delay 2)) ;; Delay syntax checking when idle

;; Optional: Custom Flycheck Behavior for C
(add-hook 'c-mode-hook
          (lambda ()
            (setq flycheck-gcc-language-standard "c11") ;; Use C11 standard
            (setq flycheck-clang-language-standard "c11"))) ;; Apply for Clang as well

;; Scrolling Configuration
(setq mouse-wheel-progressive-speed nil) ;; Disable accelerated scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; Smooth scrolling, one line per wheel tick
(setq scroll-conservatively 101) ;; Prevent recentering while scrolling
(setq scroll-step 1) ;; Scroll by one line at a time
(setq auto-window-vscroll nil) ;; Disable automatic vertical scroll adjustments
(setq pixel-scroll-mode nil) ;; Ensure pixel scrolling is off
(setq fast-but-imprecise-scrolling t) ;; Optimize for immediate feedback while scrolling

;; Ibuffer Customization
(use-package ibuffer
  :ensure t
  :bind ("C-x C-b" . ibuffer)) ;; Replace default buffer list with ibuffer

;; UI Customizations
(menu-bar-mode -1) ;; Remove menu bar
(tool-bar-mode -1) ;; Remove tool bar
(scroll-bar-mode -1) ;; Remove scroll bar
(setq inhibit-startup-screen t) ;; Disable startup screen
(setq-default indent-tabs-mode nil  ;; Use spaces instead of tabs globally
              tab-width 4)          ;; Set global tab width to 4 spaces
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t) ;; Enable relative line numbers

;; Ensure Tab Inserts Four Spaces in All Modes
(defun enforce-indent-setup ()
  "Force Tab key to insert spaces and display consistent dots for indentation."
  (setq-local indent-tabs-mode nil) ;; Use spaces for indentation
  (setq-local tab-width 4)          ;; Set tab width to 4 spaces
  (local-set-key (kbd "TAB") 'indent-for-tab-command)) ;; Tab inserts spaces
(add-hook 'after-change-major-mode-hook 'enforce-indent-setup) ;; Apply to all modes

;; Enable c-mode for C files
(add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode)) ;; Ensure .c files use c-mode

;; Compile Shortcut
(defun my-compile ()
  "Compile the current C file."
  (interactive)
  (save-buffer)
  (let ((compile-command (concat "gcc -o " (file-name-sans-extension buffer-file-name) " " buffer-file-name)))
    (compile compile-command)))
(global-set-key (kbd "C-c C-c") 'my-compile) ;; Add a global compile shortcut

;; Display Dots for Indentation Using Whitespace Mode
(setq whitespace-style '(face spaces trailing lines-tail space-mark tab-mark))
(setq whitespace-display-mappings
      '((space-mark 32 [183] [46]) ;; Display spaces as centered dots
        (tab-mark 9 [183 9] [46 9]))) ;; Display tabs as dots, consistent with spaces
(add-hook 'c-mode-hook 'whitespace-mode) ;; Enable whitespace mode for c-mode

;; Disable Electric Indent Mode Globally
(electric-indent-mode -1)

;; macOS Clipboard Integration
(setq select-enable-clipboard t) ;; Enable clipboard sharing

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

;; Font Adjustments for macOS
(set-face-attribute 'default nil
                    :family "Menlo" ;; macOS default monospace font
                    :height 160)    ;; Adjust font size for macOS

;; Enhanced and Smaller Mode Line
(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                "%b"                        ;; Buffer name
                " · %l:%c"                   ;; Line and column
                " · %I"                      ;; Buffer size
                " · %m"                      ;; Major mode
                (:eval (unless (string= (symbol-name buffer-file-coding-system) "utf-8-unix")
                         (concat " · " (symbol-name buffer-file-coding-system)))) ;; Show encoding if not UTF-8
                mode-line-modes))            ;; Minor modes

;; Set Smaller Font Size for Mode Line
(set-face-attribute 'mode-line nil :height 130) ;; Reduce mode line font size
(set-face-attribute 'mode-line-inactive nil :height 130) ;; Reduce inactive mode line font size

;; Kill All Buffers Function
(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (switch-to-buffer "*scratch*"))

;; Remove default scratch buffer message
(setq initial-scratch-message nil)

;; Enable icomplete-mode for minibuffer autocomplete
(icomplete-mode 1)
