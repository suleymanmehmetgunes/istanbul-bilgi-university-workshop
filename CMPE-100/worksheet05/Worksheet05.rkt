;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Worksheet05) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp")) #f)))
;QUESTION 1
;Data definition: number
;Purpose: to categorise BMI value
;Contract: categoriseBMI : number(index) ---> string(status)
;Example:
(check-expect (categoriseBMI 20) "Normalweight")
(check-expect (categoriseBMI 4) "Underweight")
;Function
(define (categoriseBMI index)
  (cond
    ((<= index 18.5) "Underweight")
    ((and (< 18.5 index) (<= index 25)) "Normalweight")
    ((and (< 25 index) (<= index 30)) "Overweight")
    (else "Obesity")))
;Test
(categoriseBMI 20)
(categoriseBMI 31)

;QUESTION 2
;Data definition: number
;Purpose: to categorise BMI value
;Contract: categoriseBMI : number(index) ---> string(status)
;Example:
(check-expect (connectionBill 3.2) 31.4)
(check-expect (connectionBill 0) 29)
;Function
(define (connectionBill capacity)
  (cond
    ((and (>= capacity 0) (<= capacity 3)) 29)
    (else (+ 29 (* (- capacity 3) 12)))))
;Test
(connectionBill 2)
(connectionBill 3.2)

;QUESTION 3
(define spaceSize 300)
(define myCircle (circle 15 "solid" "red"))
(define myScene (empty-scene spaceSize spaceSize))

(define (myFlyingCircle y)
  (cond
    ((< y (/ spaceSize 2)) (place-image myCircle y y myScene))
    ((= y (/ spaceSize 2)) (place-image myCircle 150 150 myScene))
    ((and (> y (/ spaceSize 2)) (< y spaceSize))(place-image myCircle (- (/ spaceSize 2) (- y (/ spaceSize 2))) (- (/ spaceSize 2) (- y (/ spaceSize 2))) myScene))
    ((>= y spaceSize) (place-image myCircle 0 0 myScene))))

(animate myFlyingCircle)

(define (connectionBillv2 usage limitation fee exceed)
  (cond
    ((and (>= usage 0) (<= usage limitation)) fee)
    (else (+ fee (* (- usage limitation) exceed)))))
;Test
"ConnectionBillv2"
(connectionBillv2 2 3 29 12)
(connectionBillv2 3.2 3 29 12)