(defun remove-symbol (l1 l2) 
                    (if (not l2) 
                        '() 
                      (if (eq l1 (first l2))
                          (remove-symbol l1 (rest l2))
                        (cons (car l2) (remove-symbol l1 (rest l2))))))

(defun find-first (pred l1)
  (first
   (remove-symbol NIL
           (mapcar (lambda (x) (and (funcall pred x) x)) l1) )))

(defun compose (f g) (lambda (x) (funcall f (funcall g x))))