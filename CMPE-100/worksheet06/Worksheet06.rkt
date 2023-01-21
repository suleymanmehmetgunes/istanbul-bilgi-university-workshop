;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Worksheet06) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp")) #f)))
;Purpose: The function shows the which month that given no by user.
;Contract: findMonth : number (month) → String
;Examples:
(check-expect (findMonth 7) "summer")
(check-expect (findMonth 4) "spring")
;Function:
(define (findMonth m)
  (cond
    ((< m 0) (error "invalid, negative number"))
    ((> m 12) (error "invalid, month can not be higher than 12"))
    ((and (>= m 3) (<= m 5)) "spring")
    ((and (>= m 6) (<= m 8)) "summer")
    ((and (>= m 9) (<= m 11)) "fall")
    (else "winter")))
;Test:
(findMonth 10)
(findMonth 5)

;Purpose: The function sum the numbers between n and m, [n,m]. 
;Contract: sumNtoM: number number → number
;Examples:
(check-expect (sumNtoM 2 2) 2)
(check-expect (sumNtoM 5 3) 12)
;Function:
(define (sumNtoM n m)
  (cond
    ((= n m) n)
    ((> n m) (sumNtoM m n))
    (else (+ n (sumNtoM(+ n 1) m)))))
;Test:
(sumNtoM 3 5)
(sumNtoM 5 1)

;Purpose: The function concatanes the given string n times.
;Contract: concatString: String number → String
;Examples:
(check-expect (concatString "selam" 2) "selamselam")
(check-expect (concatString "a" 5) "aaaaa")
;Function:
(define (concatString str n)
  (cond
    ((< n 0) (error "invalid"))
    ((= n 0) "")
    ((= n 1) str)
    ((> n 1) (string-append str (concatString str (- n 1))))))
;Test:
(concatString "ali" 3)
(concatString "hi" 5)