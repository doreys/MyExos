#!/usr/bin/env perl6

use v6 ;

# ------------------------------------------------------
#`[
* Created By : sdo
* File Name : inheritTest.p6
* Creation Date : Wed Jul 25 22:21:04 2018
* Last Modified : Wed Jul 25 23:55:53 2018
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

class PointMobile is PointDuPlan {
	has $.abscisse is rw;
	has $.ordonnée is rw;

    method print {
	    say "B1:",self.abscisse;
	    say "B2:",self.ordonnée ;
    }

    method déplace (Numeric $x, Numeric $y) {
        $.abscisse += $x;
        $.ordonnée += $y;
    }
}

class Pixel is PointDuPlan {
    has %.couleur is rw;

    method change_couleur(%teinte) {
         self.couleur = %teinte
    }   

    method change_couleur2(Int $red, Int $green, Int $blue) {
        # la signature utilise des arguments positionnels
        self.couleur = (rouge => $red, vert => $green, bleu => $blue)
    }
}


subset Octet of Int where {$_ > 0 and $_ <= 255};

my $point = PointMobile.new(
			    abscisse => 3,
			    ordonnée => 4,
			    );

$point.print;
say "Coordonnées : ", $point.PointDuPlan::coordonnées;
say "Distance au point origine : ", $point.distanceAuCentre.round(0.01);
printf "%s: rayon = %.4f, thêta (rad) = %.4f\n", "Coordonnées polaires", $point.coordonnéesPolaires;
say "--> Déplacement du point.";
$point.print;
$point.déplace(4, 5);
$point.print;
say "Nouvelles coordonnées : ", $point.coordonnées;
say "Distance au point origine : ", $point.distanceAuCentre.round(0.01);
printf "%s: rayon = %.4f, thêta (rad) = %.4f\n", "Coordonnées polaires", $point.coordonnéesPolaires;
