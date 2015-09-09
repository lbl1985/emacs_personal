;; --------- Quick Access to Freq Files --------- 
(defun freq-n-files (&optional n)
  "select nth freq file"
  (interactive)
  (setq n (read-number "0: .emacs 1: general.el 2: code.el 3: wj.org 4:customerCode.el 5: emacs_rocks.el "))
  (case n
    (0 (find-file "~/.emacs"))
    (1 (find-file "~/.xemacs/general.el"))
    (2 (find-file "~/.xemacs/code.el"))
    (3 (find-file "c:/Users/bil/Documents/skydrive/SkyDrive @ Microsoft/work/work_journal.org"))
    (4 (find-file "~/.xemacs/customerCode.el"))
    (5 (find-file "~/.xemacs/emacs_rocks.el"))
    (otherwise "~/.emacs")))

(global-set-key "\C-cf" 'freq-n-files)


;; --------- Doc-View Mode Navigation ---------
(require 'doc-view)
(define-key doc-view-mode-map (kbd "s-[") 'doc-view-next-line-or-next-page)
(define-key doc-view-mode-map (kbd "s-]") 'doc-view-previous-line-or-previous-page)


(defun buffer-mode (buffer-or-string)
  (with-current-buffer buffer-or-string
    major-mode))


(defun other-buffer-major-mode ()
  "major-mode name in the other window"
  (other-window 1)
  (setq ob-major-name major-mode)
  (other-window -1)
  ob-major-name)


;; --------- Window Manpulation ---------
(defun merge-window-vertical ()
  (interactive)
  (progn
    (setq above-element (window-in-direction 'above))
    (setq below-element (window-in-direction 'below)))
  (when above-element
    (progn
      (select-window above-element)
      (delete-window)))
  (when below-element
    (progn
      (select-window below-element)
      (delete-window)))
  )


(defun merge-window-horizental ()
  (interactive)
  (progn
    (setq left-element (window-in-direction 'left))
    (setq right-element (window-in-direction 'right)))
  (when left-element
    (progn
      (select-window left-element)
      (delete-window)))
  (when right-element
    (progn
      (select-window right-element)
      (delete-window)))
  )


; Window operaction
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-below)
(global-set-key (kbd "M-3") 'split-window-right)


(global-set-key (kbd "M-4") 'merge-window-vertical)
(global-set-key (kbd "M-5") 'merge-window-horizental)

; Utility
(defun insertconst ()
  (interactive "*" )
  (insert "%MEDIAROOT%\\"))

(global-set-key (kbd "M-c") 'insertconst)

(defun separate-common ()
  (interactive "*")
  (save-excursion
    (save-restriction
      (save-match-data
	(widen)
	(goto-char (point-min))
	(while (search-forward "\;" nil t)
	  (let ((start (point)))
	    (newline)
	    (goto-char (+ start 1)))))))
)
