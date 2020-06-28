
(cl:in-package :asdf)

(defsystem "myprocess-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "process_points" :depends-on ("_package_process_points"))
    (:file "_package_process_points" :depends-on ("_package"))
  ))