;;;; Chapter 2 of The Little Schemer:
;;;; Do It, Do It Again, and Again, and Again ...

;;; primitives: car cdr cons null atom eq

;;; `cond` returns nil, `t` is true, `nil` is false

(in-package :cl-user)
(defpackage the_little_schemer_in_common_lisp.02-do-it-again
  (:use :cl)
  (:export :latp
           :memberp))
(in-package :the_little_schemer_in_common_lisp.02-do-it-again)

;;; The First Commandment (preliminary)
;;; Always ask null as the first question in expressing any function.

(defun latp (l)
  (cond
    ((null l) t)
    ((atomp (car l)) (latp (cdr l)))
    (t nil)))

(latp '(bacon and eggs))  ;t
(latp '(bacon (switch or eggs)))  ;nil

(defun memberp (a lat)
  (cond
    ((null lat) nil)
    (t (or (eql a (car lat))
           (memberp a (cdr lat))))))

(memberp  'meat '(mashed potatoes and meat gravy)) ;t
(memberp  'meat '(mashed potatoes and egg gravy)) ;nil
(memberp  'meat '(mashed potatoes and (meat egg) gravy)) ;nil

;;; CL provides the `member` function which returns the list from the element
;;; onward, or nil if none found.
(member  'meat '(mashed potatoes and meat gravy)) ; (MEAT GRAVY)
