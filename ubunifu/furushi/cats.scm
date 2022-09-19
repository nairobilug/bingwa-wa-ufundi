;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2022 jgart <jgart@dismail.de>
;;; Copyright © 2022 Munyoki Kilyungi <me@bonfacemunyoki.com>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (ubunifu furushi cats)
  #:use-module (guix)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (gnu packages imagemagick)
  #:use-module (guix licenses)
  #:use-module (guix build-system copy))

(define-public flipped-cat
    (package
      (name "flipped-cat")
      (version "06-03-2011")
      (source
       (origin
         (method url-fetch)
         (uri "https://upload.wikimedia.org/wikipedia/commons/9/9f/Cat_public_domain_dedication_image_0012.jpg")
         (file-name (string-append name "-" version ".jpg"))
         (sha256
          (base32
           "1kffnnjxsva0vhrgwqfix30zgppzfqrx7jblknayz3fp2v36xz55"))))
      (build-system copy-build-system) ; meme-build-system?
      (native-inputs (list imagemagick))
      (arguments
       `(#:install-plan '(("." "share/flipped-cat"))
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'flip-image
             (let ((cat "flipped-cat-06-03-2011.jpg"))
               (lambda _
                 (invoke "convert"
                         cat
                         "-flip"
                         ; todo: help-guix 
                         ;; name package field is not found in this scope.
                         (string-append "flipped-cat"
                                        ;; This is convoluted.
                                        (string-take-right cat 4))))))
           (add-after 'install 'delete-original-cat
             (lambda* (#:key outputs #:allow-other-keys)
               (let* ((out (assoc-ref outputs "out")))
                 (delete-file
                   (string-append out
                                  "/share/flipped-cat/"
                                  "flipped-cat-06-03-2011.jpg"))))))))
      (home-page "https://commons.wikimedia.org/wiki/Main_Page")
      (synopsis "An upside down cat")
      (description (string-append synopsis ".")) ; todo: give a better desc.
      (license (or cc0
                   cc-by2.0
                   cc-by3.0
                   cc-by4.0
                   cc-by-sa2.0
                   cc-by-sa3.0
                   cc-by-sa4.0)))) ; todo or gfdl? which one is it? 

(define (get-file-name pkg)
  "Get the package's file-name in the origin record."
  (origin-file-name (package-source pkg))) ; todo: use clojure pipe macro instead?

