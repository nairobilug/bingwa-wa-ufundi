;;; GNU Guix --- Functional package management for GNU
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


(define-module (ubunifu furushi python)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages databases)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system python))

(define-public python-walrus
  (package
    (name "python-walrus")
    (version "0.9.2")
    (source (origin
              (method url-fetch)
              (uri (pypi-uri "walrus" version))
              (sha256
               (base32
		"1bhfjgcpl8r3m3n6ir3bawa7ispmwkih2j1fhgnkbhqbhdc7c8b6"))))
    (build-system python-build-system)
    ;; Disable tests since this package requires a running redis
    ;; connection!
    (arguments
     `(#:tests? #f))
    (propagated-inputs (list python-redis))
    (home-page "http://github.com/coleifer/walrus/")
    (synopsis "walrus")
    (description "walrus")
    (license #f)))
