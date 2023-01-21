;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Worksheet04) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp")) #f)))
;WORKSHEET04

;QUESTION 1
;Data definition: number
;Purpose: to find the fahre of given cel
;Contract: fromCeltoFahr : number(c) ---> number(f)
;Example:
(check-expect (fromCeltoFahr 50) 122)
(check-expect (fromCeltoFahr 100) 212)
;Header:
;(define (fromCeltoFahr c) number)
;Template
;(define (fromCeltoFahr c) (..f..))
;Function
(define (fromCeltoFahr c)
  (+ (* 9/5 c) 32))
;Test
(fromCeltoFahr 50)

;QUESTION 2
;Data definition: numbers
;Purpose: to find the area of the rect
;Contract: areaOfRect : number(x) number(y) ---> number(area)
;Function
(define (areaOfRect w h)
  (* w h))
;Test
(areaOfRect 5 10)

;QUESTION 3
;Data definition: numbers
;Purpose: to draw a rect
;Contract: drawRect : number(x) number(y) ---> draw(area)
(define (drawRect w h)
  (rectangle w h "solid" "black"))
;Test
(drawRect 50 50)

;QUESTION 4
;Data definition: numbers
;Purpose: to calculate BMI
;Contract: calculateBMI : number(x) number(y) ---> numbers(bmi)
(check-expect (calculateBMI 75 1.00) 75)
;Function
(define (calculateBMI w h)
  (/ w (expt h 2)))
;Test
(calculateBMI 60 1.52)

;QUESTION 5
(define myIMG (circle 15 "solid" "red"))
(define mySCN (empty-scene 300 300))

(define (flyBall y)
  (place-image myIMG (- 300 y) (- 300 y) mySCN))

(animate flyBall)