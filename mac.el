(load "~/.config/emacs/maf/myinit.el")

(add-to-list 'default-frame-alist '(left . 335))
(add-to-list 'default-frame-alist '(top . 50))
(add-to-list 'default-frame-alist '(height . 94))
(add-to-list 'default-frame-alist '(width . 268))

(set-frame-font "Hack Nerd Font 12" nil t)

(find-file "~/.config/emacs/maf/mac.el")
