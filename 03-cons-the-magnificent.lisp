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
  ;; remove the first member of the list of atoms `lat` that is equal to the atom `a`
  (cond
    ((null lat) nil)
    ((eql a (car lat)) (cdr lat))
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
    ((null l) nil)
    (t (cons (caar l)
             (firsts (cdr l))))))

(firsts '(((five plums) four) (eleven green oranges) ((no) more)))
; ((FIVE PLUMS) ELEVEN (NO))


;;; The function `insertR` takes 3 args, 2 atoms and a list, and creates a new
;;; list with the 'new' inserted to the right of first instance of `old`.

(defun insertR (new old lat)
  (cond
    ((null lat) nil)
    ((eql old (car lat)) (cons old (cons new (cdr lat))))
    (t (cons (car lat) (insertR new old (cdr lat))))))

(insertR 'jalapeno 'and '(tacos tamales and salsa))
; (TACOS TAMALES AND JALAPENO SALSA)

(insertR 'topping 'fudge '(ice cream with fudge for dessert))
; (ICE CREAM WITH FUDGE TOPPING FOR DESSERT)


;;; The function `insertL` takes 3 args, 2 atoms and a list, and creates a new
;;; list with the 'new' inserted to the left before the first instance of `old`.

(defun insertL (new old lat)
  (cond
    ((null lat) nil)
    ((eql old (car lat)) (cons new lat))
    (t (cons (car lat) (insertL new old (cdr lat))))))

(insertL 'jalapeno 'and '(tacos tamales and salsa))
; (TACOS TAMALES JALAPENO AND SALSA)


;;; The function `subst` takes 3 args, 2 atoms and a list, and creates a new
;;; list with the first instance of `old` in the list replaced by `new`.
;;; `subst` is an existing function in Common Lisp (CLTL2 Section 15.4, p.424)
;;; so we must use a different name for our simple version, say, `my-subst`:

(defun my-subst (new old lat)
  (cond
    ((null lat) nil)
    ((eql old (car lat)) (cons new (cdr lat)))
    (t (cons (car lat) (my-subst new old (cdr lat))))))

(my-subst 'topping 'fudge '(ice cream with fudge for dessert))
; (ICE CREAM WITH TOPPING FOR DESSERT)

(subst 'topping 'fudge '(ice cream with fudge for dessert))
; (ICE CREAM WITH TOPPING FOR DESSERT)

; The 2 functions are not equivalent with multiple instances of `old` in `lat`:
; `subst` replaces all instances, `my-subst` only replaces the first instance.

(my-subst 'topping 'fudge '(ice cream with fudge and fudge for dessert))
; (ICE CREAM WITH TOPPING AND FUDGE FOR DESSERT)

(subst 'topping 'fudge '(ice cream with fudge and fudge for dessert))
; (ICE CREAM WITH TOPPING AND TOPPING FOR DESSERT)

