;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2023 Benson Muite <benson_muite@emailplus.org>
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

(define-module (ubunifu furushi inkstitch)
  #:use-module (gnu packages inkscape)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix utils)
  #:use-module (guix build-system copy))

(define-public inkstitch
  (package
    (name "inkstitch")
    (version "3.0.1")
    (source
      (origin
        (method url-fetch)
        (uri
          (string-append "https://github.com/inkstitch/inkstitch/releases/latest/"
                         "download/inkstitch-" version "-linux.tar.xz"))
        (sha256
          (base32 "0qcwg2bvy6cq8c9jl0bw855d0q1qvjk70jwfqx2bvbxy5lj8hz5n"))))
    (build-system copy-build-system)
    (arguments
      '(#:install-plan
         '(("." "share/inkscape/extensions/inkstitch/"))))
    (supported-systems '("x86_64-linux"))
    (propagated-inputs
      (list inkscape))
    (home-page "https://inkstitch.org")
    (synopsis "An Inkscape extension for machine embroidery design")
    (description
     "Ink/Stitch aims to be a full-fledged embroidery digitizing platform
based entirely on free, open source software. Our goal is to be
approachable for hobbyists while also providing the power needed by
professional digitizers. We also aim to provide a welcoming open
source environment where contributing is fun and easy.")
    (license license:gpl3)))
