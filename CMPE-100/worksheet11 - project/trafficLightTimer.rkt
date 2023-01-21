;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname trafficLightTimer) (read-case-sensitive #t) (teachpacks ((lib "image.ss" "teachpack" "htdp") (lib "universe.ss" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.ss" "teachpack" "htdp") (lib "universe.ss" "teachpack" "2htdp")) #f)))
;visual constants
(define R 50)
(define W (* 2 R))
(define D (* 6 R))
(define ES (empty-scene W D))
(define FRAME (rectangle W D "outline" "black"))


(define REDL 
  (place-image
   (overlay/xy
    (overlay/xy
     (overlay/xy FRAME  0 (* -2 R) (circle R "solid" "red"))
     0 0 (circle R "outline" "yellow"))
    0 (* 2 R) (circle R "outline" "green"))
   (/ W 2) (/ D 2) ES))

(define YELLOWL (place-image 
                 (overlay/xy
                  (overlay/xy
                   (overlay/xy FRAME  0 (* -2 R) (circle R "outline" "red"))
                   0 0 (circle R "solid" "yellow"))
                  0 (* 2 R) (circle R "outline" "green"))
                 (/ W 2) (/ D 2) ES))

(define GREENL (place-image
                (overlay/xy
                 (overlay/xy
                  (overlay/xy FRAME  0 (* -2 R) (circle R "outline" "red"))
                  0 0 (circle R "outline" "yellow"))
                 0 (* 2 R) (circle R "solid" "green"))
                (/ W 2) (/ D 2) ES))


;TrafficLight (TL) is one of
; - "red"
; - "yellow"
; - "green"
; interp. each string above represents a corresponding traffic light.

(define-struct NTL (Light Timer))
; NTL is a structure like
; (make-NTL String Number)
; Light is TL
; Timer is a Number represents time passed so far for the current light

;Time for each color
(define RT 9)
(define GT 6)
(define YT 3)



;TASK-1) Write constructors of NTL:

;CONSTRUCTOR

;........................



;TASK-2) Write Selectors for NTL:

;SELECTOR

;.........................



;TASK-3) Write predicate for NTL:

;PREDICATE

;.........................



;TASK-4) Write contract and four more examples:
; Contract: tick-f: 
; Purpose: Check the timer of NTL. If it is equal to 0, change the light, otherwise subtract one from counter
; Red --> Green
; Green --> Yellow
; Yellow --> Red

; Example:
(check-expect (tick-f (make-NTL "red" 0))(make-NTL "green" GT))
(check-expect (tick-f (make-NTL "red" 4))(make-NTL "red" 3))


;TASK-5) Write template:
;..........................



;TASK-6) Write tick-f function (needs change-light function):
;..........................





;TASK-7) Write contract and four more examples:
; Contract: change-light: 
; Purpose: change the light and produce a new traffic light
(check-expect (change-light "red")(make-NTL "green" GT))



;TASK-8) Write template:
;..........................



;TASK-9) Write change-light function:
;..........................
  


;TASK-10) Write contract and more examples:

;Contract: draw-f: 
;Purpose: to draw the current traffic light
;(define (draw-f antl) REDL)
(check-expect (draw-f (make-NTL "red" 4))REDL)



;TASK-11) Write template:
;..........................




;TASK-12) Write draw-f function:
;..........................
  
  


; KeyEvent is one of:
; - "r"
; - "g"
; - "y"
; - all other keyevents


;TASK-13) Write contract and more examples:
; Contract: police-officer: 
; Purpose: to change the light according to key event.
; if KeyEvent is r --> "red"
; if KeyEvent is g --> "green"
; if KeyEvent is y --> "yellow"
(check-expect (police-officer (make-NTL "red" 4) "r")(make-NTL "red" RT))

;TASK-14) Write template:
;..........................



;TASK-15) Write police-officer function:
;..........................




;NTL --> Images
(define (main init)
  (big-bang
   init
   (on-tick tick-f)
   (on-draw draw-f)
   (on-key police-officer)))

(main (make-NTL "yellow" 3))