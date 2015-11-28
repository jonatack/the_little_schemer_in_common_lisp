;;;; Chapter 1 of The Little Schemer:
;;;; Toys

;;;; s-exps, atoms, lists, car, cdr, cons, null, eq

;;; All atoms and lists are S-expressions.

;;; An atom is a string of characters.

(defun atomp (x)
  (not (listp x)))

;;; A list is a collection of S-expressions enclosed by parentheses.
;;; A null (or empty) list contains zero S-expressions enclosed by parentheses.

;;; The Law of Car
;;; The primitive car is defined only for non-empty lists.

;;; The Law of Cdr
;;; The primitive cdr is defined only for non-empty lists.
;;; You cannot ask for the cdr of an atom.
;;; The cdr of any non-empty list is always another list.

(defvar l '((b) (x y) ((c))))

(cdr (cdr l)) ; (((c)))
(cddr l)      ; (((c)))

;;; The Law of Cons
;;; The primitive `cons` takes two arguments.
;;; The first one is any s-expression; the second one must be a list.
;;; The result is a list.

;;; The Law of Null
;;; The primitive null is defined only for lists.

;;; The Law of Eq
;;; The primitive eq takes 2 arguments.

