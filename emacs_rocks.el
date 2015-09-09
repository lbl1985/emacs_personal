;; ------- Line Number -------------
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
	(linum-mode 1)
	(goto-line (read-number "Goto line:"))) 
   (linum-mode -1)))

(global-set-key (kbd "M-l") 'goto-line-with-feedback)
(global-set-key [remap goto-line] 'goto-line-with-feedback)
