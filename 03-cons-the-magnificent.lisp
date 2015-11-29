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

;;; The Third Commandment:
;;; When building a list, describe the first typical element, and then cons it
;;; onto the natural recursion.

;;; (caar l) is short for (car (car l))



;;; The function `rember` takes 2 args (an atom and a list) and makes a new
;;; list without the first occurrence of the atom found in the old list.

(defun rember (a lat)
  (cond
    ((null lat) nil)
    ((eql a (car lat)) (cdr lat))
    (t (cons (car lat)
             (rember a (cdr lat))))))

(rember 'mint '(lamb chops and mint jelly)) ; (LAMB CHOPS AND JELLY)



;;; The function `firsts` takes one argument, a list, which is either a null
;;; list or contains only non-empty lists. It builds another list composed of
;;; the first s-expression of each internal list.

(defun firsts (lat)
  (cond
    ((null lat) nil)
    (t (cons (caar lat)
             (firsts (cdr lat))))))

(firsts '(((five plums) four) (eleven green oranges) ((no) more)))
; ((FIVE PLUMS) ELEVEN (NO))



;;; The function `insertR` takes 3 args (2 atoms and a list) and creates a new
;;; list with the new atom inserted after the first occurrence of the old atom.

(defun insertR (new old lat)
  (cond
    ((null lat) nil)
    ((eql old (car lat))
     (cons old (cons new (cdr lat)))) ; cons `new` between `old` and `cdr lat`
    (t (cons (car lat)
             (insertR new old (cdr lat))))))

(insertR 'jalapeno 'and '(tacos tamales and salsa))
; (TACOS TAMALES AND JALAPENO SALSA)

(insertR 'topping 'fudge '(ice cream with fudge for dessert))
; (ICE CREAM WITH FUDGE TOPPING FOR DESSERT)



;;; The function `insertL` takes 3 args (2 atoms and a list) and creates a new
;;; list with the new atom inserted before the first occurrence of the old atom.

(defun insertL (new old lat)
  (cond
    ((null lat) nil)
    ((eql old (car lat))
     (cons new lat)) ; cons `new` with `lat` (including `old`)
    (t (cons (car lat)
             (insertL new old (cdr lat))))))

(insertL 'jalapeno 'and '(tacos tamales and salsa))
; (TACOS TAMALES JALAPENO AND SALSA)



;;; The function `subst` takes 3 args, 2 atoms and a list, and creates a new
;;; list with the first occurrence of `old` in the list replaced by `new`.

;;; `subst` is an existing function in Common Lisp (CLTL2 Section 15.4, p.424)
;;; so we must use a different name for our simple version, say, `my-subst`:

(defun my-subst (new old lat)
  (cond
    ((null lat) nil)
    ((eql old (car lat))
     (cons new (cdr lat))) ; cons `new` with `car lat` (without `old`)
    (t (cons (car lat)
             (my-subst new old (cdr lat))))))

(my-subst 'topping 'fudge '(ice cream with fudge for dessert))
; (ICE CREAM WITH TOPPING FOR DESSERT)

(subst 'topping 'fudge '(ice cream with fudge for dessert))
; (ICE CREAM WITH TOPPING FOR DESSERT)

; The 2 functions are not equivalent with multiple instances of `old` in `lat`.
; `subst` replaces all occurrences, `my-subst` only replaces the first one:

(my-subst 'topping 'fudge '(ice cream with fudge and fudge for dessert))
; (ICE CREAM WITH TOPPING AND FUDGE FOR DESSERT)

(subst 'topping 'fudge '(ice cream with fudge and fudge for dessert))
; (ICE CREAM WITH TOPPING AND TOPPING FOR DESSERT)
