
(cl:in-package :asdf)

(defsystem "mykinect2-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "mykinect" :depends-on ("_package_mykinect"))
    (:file "_package_mykinect" :depends-on ("_package"))
  ))