#lang racket
; This is for manipulating the fields produced from an srt file. We will use srt files from the subdown.com site 
; Until we can  Call Youtube ourself through their API. I'm assuming that's how subdown does it. It keeps us from
; having to do it but their site is sketchy.

; Read the file one line at a time. The nested regex-replace calls test for caption #, start-time , and read the caption
; 

(define (read-next-line-iter file)
	   (let ((line (read-line file 'any)))
	     (unless (eof-object? line)

              
               (display  (regexp-replace "^(.?.?.?.?)$"
                         (regexp-replace "(..:..:..),... --> (..:..:..),..."
                         (regexp-replace* "<.+?>" line "") "\\1 ") "\n\\1 "))

               
	       (read-next-line-iter file))))
(call-with-input-file "report.txt.srt" read-next-line-iter)
   
