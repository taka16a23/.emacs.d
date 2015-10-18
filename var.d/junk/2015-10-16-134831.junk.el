(eval-when-compile

(defmacro hello ()
  "hello"
  `(progn
     (message "hello"))
  )

(defmacro world ()
  `(progn
     (hello)
     (message "world")
     )
  ))

(world)
