#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : newPoint3D.p6
* Creation Date : Tue Jul 31 09:20:52 2018
* @modify date 2020-01-14 03:32:49
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


class Point3D {
    has $.abscisse;
    has $.ordonnée;
    has $.hauteur;

    method coordonnées () {        # accesseur
        return ($.abscisse, $.ordonnée, $.hauteur)
    }

    method distanceAuCentre () {
        ($.abscisse ** 2 + $.ordonnée ** 2 + $.hauteur ** 2) ** 0.5
    }
    method coordonnéesPolaires () {
        return self.coordonnéesSphériques;
    }

    method coordonnéesSphériques {
        my $rhô = $.distanceAuCentre;
        my $longitude = atan2 $.ordonnée, $.abscisse;  # thêta
        my $latitude = acos $.hauteur / $rhô;          # delta (ou phi)
        return $rhô, $longitude, $latitude;
    }

    method coordonnéesCylindriques {
        # ...
    }
}
