;;;; Chapter 1 of The Little Schemer:
;;;; Toys

;;; The Law of cdr
;;; The primitive cdr is defined only for non-empty lists.
;;; The cdr of any non-empty list is always another list.

(defvar l '((b) (x y) ((c))))

(cdr (cdr l)) ; (((c)))
(cddr l)      ; (((c)))

;;; cons takes two arguments:
;;; the first one is any s-expression; the second one is any list.


