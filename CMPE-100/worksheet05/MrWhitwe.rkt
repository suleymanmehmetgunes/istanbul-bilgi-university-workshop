;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname MrWhitwe) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "abstraction.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "itunes.rkt" "teachpack" "2htdp")) #f)))
(define dutchman (above (above (rectangle 40 15 "solid" (make-color 200 16 46)) (rectangle 40 15 "solid" "white")) (rectangle 40 15 "solid" (make-color 0 61 165))))
(define myScene (empty-scene 300 300))
(- 150 4)
(define (myFlyingDutchman y)
  (cond
    ((< y 150) (place-image dutchman y y myScene))
    ((= y 150) (place-image dutchman 150 150 myScene))
    ((and (> y 150) (< y 300)) (place-image dutchman (- 150 (- y 150)) (- 150 (- y 150)) myScene))
    ((>= y 300) (place-image dutchman 0 0 myScene))))

(animate myFlyingDutchman)