(defun command-line ()
  (or 
   #+CLISP *args*
   #+SBCL *posix-argv*  
   #+LISPWORKS system:*line-arguments-list*
   #+CMU extensions:*command-line-words*
   nil))

(defun prtrans(c)
  (let ((code (char-code c)))
    (if (> code 255)
	(format t "&#X~X;" (char-code c))
	(format t "~A" c))))

(defun read-all(stream)
  (do ((c (read-char stream 'nil 'eof) 
	  (read-char stream 'nil 'eof)))
      ((eql c 'eof) 'nil)
    (prtrans c)))

(defun parse-file(filename)
  (with-open-file (str filename :direction :input)
    (read-all str)))

#+CLISP (parse-file (first (command-line)))
#+SBCL (parse-file (second (command-line)))
