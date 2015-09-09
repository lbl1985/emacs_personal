; ------------ Writing Emacs Extensions ----------
; Chapter 1
(put 'eval-expression 'disabled nil)


;; Chapter 2
; /////////////// Traversing Windows ///////////////


(defun other-window-backward (&optional n )
  "Select the previous window."
  (interactive "P")
  (other-window (- (prefix-numeric-value n)))
)
;; ===========  other-window is s-' ===========


; //////////// Line-at-a-Time Scrolling /////////////
(defun scroll-n-lines-down (&optional n)
  "Scroll down N lines (1 by default)"
  (interactive "P")
  (scroll-down (prefix-numeric-value n))
)


(defun scroll-other-window-n-lines-down (&optional n)
  "Scroll next window down N lines (1 by default)"
  (interactive "P")
  (scroll-other-window-down (prefix-numeric-value n)))


(defun scroll-n-lines-up (&optional n)
  "Scroll up N lines (1 by default)"
  (interactive "P")
  (scroll-up (prefix-numeric-value n))
)


(defun scroll-other-window-n-lines-up (&optional n)
  "Scroll next window up N lines (1 by default)"
  (interactive "P")
  (scroll-other-window (prefix-numeric-value n)))


;; ===========  Other Cursor and Text Motion Commands  ===========
(defun point-to-top ()
  "Put Point on top line of window."
  (interactive)
  (move-to-window-line 0))


(defun point-to-bottom ()
  "Put point at beginning of last visible line."
  (interactive)
  (move-to-window-line -1))


(defun line-to-top ()
  "Move current line to top of window."
  (interactive)
  (recenter 0))


;; ===========  Advised Buffer Switching  ===========
(defadvice switch-to-buffer (before existing-buffer
				    activate compile)
  "When interactive, switch to existing buffers only, 
unless given a prefix argument"
  (interactive
   (list (read-buffer "Switch to buffer:"
		      (other-buffer)
		      (null current-prefix-arg)))))


;; ===========  KeyStrokes  ===========  
(global-set-key (kbd "M-[") 'scroll-n-lines-up)
(global-set-key (kbd "M-]") 'scroll-n-lines-down)
(global-set-key (kbd "M-{") 'scroll-other-window-n-lines-up)
(global-set-key (kbd "M-}") 'scroll-other-window-n-lines-down)
(global-set-key (kbd "M-,") 'point-to-top)
(global-set-key (kbd "M-.") 'point-to-bottom)
(global-set-key (kbd "C-x ,") 'tags-loop-continue)
(global-set-key (kbd "C-x .") 'find-tag)
(global-set-key (kbd "M-!") 'line-to-top)

