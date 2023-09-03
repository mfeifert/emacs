;;; package and use-package

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.config/emacs/elpa/")
  (require 'use-package))

(require 'use-package-ensure)
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
;;(load-theme 'modus-vivendi t)
(load-theme 'catppuccin :no-confirm)
(desktop-save-mode 1)

(setq display-line-numbers 'relative)
;; (add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'org-mode-hook 'org-indent-mode)
;; (evil-set-initial-state 'special-mode 'emacs)

;; (put 'dired-find-alternate-file 'disabled nil)
(setq ido-everywhere t)
(ido-mode t)

;;; Packages

(use-package catppuccin-theme
  :config
  (load-theme 'catppuccin :no-confirm))

(use-package which-key
  :config (which-key-mode))

(use-package evil
  :init
  ;; make tab work in org-mode
  (setq evil-want-C-i-jump nil)
  ;; turn off evil-mode for special buffer types
  :config (evil-mode))

(use-package hydra)
  :init
  (load "~/docs/sys/config/emacs/hydra.el")

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

(use-package cobol-mode
  :init
  (setq auto-mode-alist
        (append
         '(("\\.cob\\'" . cobol-mode)
           ("\\.cbl\\'" . cobol-mode)
           ("\\.cpy\\'" . cobol-mode))
         auto-mode-alist)))

(use-package slime
  :init
  (setq inferior-lisp-program "sbcl"))



;;; Org-roam (copied from System Crafters)

;(defalias 'list-buffers 'ibuffer)
;;
;; (use-package org-roam
;;   :ensure t
;;   :init
;;   (setq org-roam-v2-ack t)
;;   :custom
;;   (org-roam-directory "~/RoamNotes")
;;   (org-roam-completion-everywhere t)
;;   (org-roam-dailies-capture-templates
;;     '(("d" "default" entry "* %<%I:%M %p>: %?"
;;        :if-new (file+head "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n"))))
;;   :bind (("C-c n l" . org-roam-buffer-toggle)
;;          ("C-c n f" . org-roam-node-find)
;;          ("C-c n i" . org-roam-node-insert)
;;          :map org-mode-map
;;          ("C-M-i" . completion-at-point)
;;          :map org-roam-dailies-map
;;          ("Y" . org-roam-dailies-capture-yesterday)
;;          ("T" . org-roam-dailies-capture-tomorrow))
;;   :bind-keymap
;;   ("C-c n d" . org-roam-dailies-map)
;;   :config
;;   (require 'org-roam-dailies) ;; Ensure the keymap is available
;;   (org-roam-db-autosync-mode))
