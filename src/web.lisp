(in-package :cl-user)
(defpackage home-page.web
  (:use :cl
        :caveman2
        :home-page.config
        :home-page.view
        :home-page.db
        :datafly
        :sxql)
  (:export :*web*))
(in-package :home-page.web)

;; for @route annotation
(syntax:use-syntax :annot)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)

;;
;; Routing rules

(defroute "/" ()
  (render #P"index.html"))

(defroute "/ResearchStuff" ()
  (render #P"research_hub.html"))

(defroute "/ResearchStuff/lojban" ()
  (render #P"lojban.html"))

(defroute "/ResearchStuff/lojban/journal" ()
     (render #P"work_journal.html"))

(defroute "/testing/" ()
  (render #P"testing.html"))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
