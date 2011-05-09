(in-package :cl-undead-test)

;; Fixture definitions
(def-mixture html/simple ()
    (+html/simple)
  (&body))

(def-mixture html/simple+lhtml ()
    (+html/simple +html/lhtml)
  (&body))
