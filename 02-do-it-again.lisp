;;;; Chapter 2 of The Little Schemer:
;;;; Do It, Do It Again, and Again, and Again ...

;;; primitives: car cdr cons null atom eq

;;; `cond` returns nil, `t` is true, `nil` is false

(in-package :cl-user)
(defpackage the_little_schemer_in_common_lisp.02-do-it-again
  (:use :cl)
  (:export :lat?
           :member?))
(in-package :the_little_schemer_in_common_lisp.02-do-it-again)

;;; The First Commandment (preliminary)
;;; Always ask null as the first question in expressing any function.

(defun lat? (l)
  (cond
    ((null l) t)
    ((atom (car l)) (lat? (cdr l)))
    (t nil)))

(lat? '(bacon and eggs))  ;t
(lat? '(bacon (switch or eggs)))  ;nil

(defun member? (a lat)
  (cond
    ((null lat) nil)
    (t (or (eql a (car lat))
           (member? a (cdr lat))))))

(member?  'meat '(mashed potatoes and meat gravy)) ;t
(member?  'meat '(mashed potatoes and egg gravy)) ;nil
(member?  'meat '(mashed potatoes and (meat egg) gravy)) ;nil
