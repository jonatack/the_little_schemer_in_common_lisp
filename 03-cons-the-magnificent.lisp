;;;; Chapter 3 of The Little Schemer:
;;;; Cons the Magnificent

(in-package :cl-user)
(defpackage the_little_schemer_in_common_lisp.03-cons-the-magnificent
  (:use :cl)
  (:export :rember
           :firsts))
(in-package :the_little_schemer_in_common_lisp.03-cons-the-magnificent)

;;; The Second Commandment:
;;; Use cons to build lists.

(defun rember (a lat)
  ;; remove the first member that is equal
  (cond
    ((null lat) nil) ; or ((null lat) '())
    ((eq a (car lat)) (cdr lat))
    (t (cons (car lat)
             (rember a (cdr lat))))))

(rember 'mint '(lamb chops and mint jelly)) ; (LAMB CHOPS AND JELLY)

;;; The Third Commandment:
;;; When building a list, describe the first typical element, and then cons it
;;; onto the natural recursion.

;;; (caar l) is short for (car (car l))

;;; The function `firsts` takes one argument, a list, which is either a null list or contains only non-empty lists. It builds another list composed of the first s-expression of each internal list."

(defun firsts (l)
  (cond
    ((null l) nil) ; or ((null l) '())
    (t (cons (caar l)
             (firsts (cdr l))))))

(firsts '(((five plums) four) (eleven green oranges) ((no) more)))
; ((FIVE PLUMS) ELEVEN (NO))

(defun insertR (new old lat)
  (cond
    ((null lat) nil)
    ((eq old (car lat)) (cons old (cons new (cdr lat))))
    (t (cons (car lat) (insertR new old (cdr lat))))))

(insertR 'jalapeno 'and '(tacos tamales and salsa))
; (TACOS TAMALES AND JALAPENO SALSA)

(insertR 'topping 'fudge '(ice cream with fudge for dessert))
; (ICE CREAM WITH FUDGE TOPPING FOR DESSERT)

(defun insertL (new old lat)
  (cond
    ((null lat) nil)
    ((eq old (car lat)) (cons new (cons old (insertL new old (cdr lat)))))
    (t (cons (car lat) (insertL new old (cdr lat))))))

(insertL 'jalapeno 'and '(tacos tamales and salsa))
; (TACOS TAMALES JALAPENO AND SALSA)
