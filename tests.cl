;
; 1
;
(defun remove-symbol (s l)
  "Removes all occurrences of s from l" 
  (if (endp l) '() 
    (if (eq s (first l))
    	(remove-symbol s (rest l)) (append (list (first l)) (remove-symbol s (rest l)))
    )
  )
)

(princ (remove-symbol 'a '()))
(princ #\newline)

(princ (remove-symbol 'a '(a)))
(princ #\newline)

(princ (remove-symbol 'a '(b)))
(princ #\newline)

(princ (remove-symbol 'a '(a a a a)))
(princ #\newline)

(princ (remove-symbol 'a '(b b b b b)))
(princ #\newline)

(princ (remove-symbol 'a '(a c g t a a a a))) 
(princ #\newline)

; 
; 2
;

(defun find-first (p l) "find the first element that satisfies the predicate p" (if (endp l) '() (if (funcall p (first l)) (first l) (find-first p (rest l)))))

(princ (find-first #'oddp '(1 2 3)))
(princ #\newline)

(princ (find-first #'oddp '(2)))
(princ #\newline)

(princ (find-first #'oddp '()))
(princ #\newline)

(princ (find-first #'characterp '(1 2 3 4 #\a)))
(princ #\newline)

;
; 3
;

(defun compose (f g) 
  "Returns f o g. (f o g)(x) = f(g(x))" 
  (lambda (x) (funcall f (funcall g x)) ) 
)

(princ (funcall (compose #'char-upcase #'code-char) 100))
(princ #\newline)

