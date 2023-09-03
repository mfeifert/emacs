(load "~/.config/emacs/maf/myinit.el")

(add-to-list 'default-frame-alist '(left . 335))
(add-to-list 'default-frame-alist '(top . 50))
(add-to-list 'default-frame-alist '(height . 72))
(add-to-list 'default-frame-alist '(width . 208))

(set-frame-font "Menlo 15" nil t)

(find-file "~/.config/emacs/maf/mac.el")
