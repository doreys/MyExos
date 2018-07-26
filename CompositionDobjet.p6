#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : CompositionDobjet.p6
* Creation Date : Thu Jul 26 23:21:03 2018
* Last Modified : Thu Jul 26 23:56:41 2018
* Email Address : sdo@macbook-pro-de-sdo.home
* Version : 0.0.0.0
* License:
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the
* 	Creative Commons Attribution-NonCommercial 3.0 Unported License, which is available at
* 	at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
]
# ------------------------------------------------------


class PointDuPlan {
    has $.abscisse;
    has $.ordonnée;

    method coordonnées {        # accesseur
	print "in A: ";
        return (self.abscisse, self.ordonnée);
    }

    method distanceAuCentre {
       (self.abscisse ** 2 + self.ordonnée ** 2) ** 0.5
    }

    method coordonnéesPolaires {
        my $rayon = self.distanceAuCentre;
        my $thêta = atan2 self.ordonnée, self.abscisse; # (azimut)
        return $rayon, $thêta;
    } 
}

class Bipoint {
    has PointDuPlan $.origine;
    has PointDuPlan $.arrivée;

    method norme {
        return (($!arrivée.abscisse - $!origine.abscisse) ** 2 +
           ($!arrivée.ordonnée - $!origine.ordonnée) **2) ** 0.5;
    }

    method pente {
        return ($!arrivée.ordonnée - $!origine.ordonnée) /
		($!arrivée.abscisse - $!origine.abscisse);
    }
}


my $debut = PointDuPlan.new(
    abscisse => 2,
    ordonnée => 1,
);  
my $fin = PointDuPlan.new(
    abscisse => 3,
    ordonnée => 4,
);
my $segment = Bipoint.new(
    origine => $debut,
    arrivée => $fin
);
say "Norme = {$segment.norme.round(0.001)}";  # -> Norme = 3.162
say "Pente = {$segment.pente.round(0.001)}";  # -> Pente = 3
