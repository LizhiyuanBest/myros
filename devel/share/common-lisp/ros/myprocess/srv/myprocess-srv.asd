
(cl:in-package :asdf)

(defsystem "myprocess-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "myprocess_pose" :depends-on ("_package_myprocess_pose"))
    (:file "_package_myprocess_pose" :depends-on ("_package"))
    (:file "myprocess_position" :depends-on ("_package_myprocess_position"))
    (:file "_package_myprocess_position" :depends-on ("_package"))
  ))