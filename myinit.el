;;; package and use-package

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; (eval-when-compile
;;   ;; Following line is not needed if use-package.el is in ~/.emacs.d
;;   (add-to-list 'load-path "~/.config/emacs/elpa/")
;;   (require 'use-package))

;; (require 'use-package-ensure)
(setq use-package-always-ensure t)

;;; General settings

;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory t)))

(setq backup-directory-alist
      `((".*" . "~/.config/emacs/backups")))
(setq auto-save-file-name-transforms
      `((".*" "~/.config/emacs/autosaves" t)))

(tool-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)
(desktop-save-mode 1)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(add-hook 'org-mode-hook 'org-indent-mode)

;; (put 'dired-find-alternate-file 'disabled nil)
(setq ido-everywhere t)
(ido-mode t)


;;; Packages

(use-package catppuccin-theme
  :config
  (load-theme 'catppuccin :no-confirm))

(use-package which-key
  :config
  (which-key-setup-minibuffer)
  (setq max-mini-window-height 0.5)
  (which-key-mode))

(use-package evil
  :init
  (setq evil-want-integration t)
  ;; make tab work in org-mode
  (setq evil-want-C-i-jump nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  ;; (lookup-key global-map (kbd "C-c"))
  (evil-global-set-key 'normal (kbd "SPC c") (lookup-key global-map (kbd "C-c")))  ;; not working
  (evil-global-set-key 'normal (kbd "SPC h") (lookup-key global-map (kbd "C-h")))
  (evil-global-set-key 'normal (kbd "SPC SPC s") 'save-buffer)
  (evil-global-set-key 'normal (kbd "SPC SPC f") 'find-file)
  (evil-global-set-key 'motion (kbd "SPC") nil)
  (evil-global-set-key 'motion (kbd "SPC x") ctl-x-map)
  (evil-global-set-key 'motion (kbd "SPC c") (lookup-key global-map (kbd "C-c")))  ;; not working
  (evil-global-set-key 'motion (kbd "SPC h") (lookup-key global-map (kbd "C-h")))

  (evil-set-initial-state 'special-mode 'emacs)
  (evil-set-initial-state 'Info-mode 'emacs)
  )

(use-package org-superstar
  :init
  ;; start org-superstar-mode automatically for org files
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(use-package ledger-mode
  :config
  (setq ledger-default-date-format "%Y-%m-%d"))
  ;; run report when enabling ledger-mode (not working)
  ;; (add-hook 'ledger-mode-hook (ledger-report "bs" ""))
  (setq ledger-reports
   '(("bs" "%(binary) -f %(ledger-file) bal Assets Liabilities")
     ("is" "%(binary) -f %(ledger-file) bal Income Expenses -p 'this month'" )
     ("reg" "%(binary) -f %(ledger-file) reg")))

(use-package magit)


;; (use-package hydra)
;;   :init
;;   (load "~/.config/emacs/maf/hydra.el")

;; (use-package slime
;;   :init
;;   (setq inferior-lisp-program "sbcl"))

;; (use-package cobol-mode
;;   :init
;;   (setq auto-mode-alist
;;         (append
;;          '(("\\.cob\\'" . cobol-mode)
;;            ("\\.cbl\\'" . cobol-mode)
;;            ("\\.cpy\\'" . cobol-mode))
;;          auto-mode-alist)))
