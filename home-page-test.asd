(in-package :cl-user)
(defpackage home-page-test-asd
  (:use :cl :asdf))
(in-package :home-page-test-asd)

(defsystem home-page-test
  :author "Lilas"
  :license ""
  :depends-on (:home-page
               :prove)
  :components ((:module "t"
                :components
                ((:file "home-page"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
