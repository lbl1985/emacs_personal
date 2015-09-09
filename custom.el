; Attempt for changing cmd.exe behavior
(setq explicit-cmd.exe-args '("/k doskey /macrofile=%HOME%\Downloads\doskey.mac"))
; multiple-cursor
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
;; misc
(setq-default tab-width 4)            ;; but maintain correct appearance
(setq default-tab-width 4)
;; copy-past
(global-set-key (kbd "C-c C-c") 'easy-kill)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-x C-x") 'kill-region)
