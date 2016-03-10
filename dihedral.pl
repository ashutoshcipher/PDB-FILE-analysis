#!/usr/bin/perl
use Statistics::R ;
use CGI qw(:standard);
use DBI;
use DBD::CSV;
use Math::VectorReal;
use Math::Trig;
use Math::VectorReal qw(:all);
open(DATA, "$ARGV[0]") or die "Couldn't open file file.txt, $!";
chomp(@dataArray = <DATA>);
close(DATA);
@helixs="";
@sheets="";
$s=1;
@dist;
$an=0;
$MODEL=1;
$ssbond=0;
$strand =  "A";
$amino =0;
open(DT, "$ARGV[0]") or die "Couldn't open file file.txt, $!";
chomp(@dA = <DT>);
close DT;
$outputFile = "$ARGV[1]";
open (OUTFILE, ">>$outputFile");
sub proc {

    my @a = split ' ', shift;   # line 1
    my @b = split ' ', shift;   # line 2
    my @c = split ' ', shift;   # line 3
    my @d = split ' ', shift;   # line 4
    my $xij = ($a[6] - $b[6]);      # calculate the diffs
    my $yij = ($a[7] - $b[7]);      # calculate the diffs
    my $zij = ($a[8] - $b[8]);
    my $xkj = ($c[6] - $b[6]);      # calculate the diffs
    my $ykj = ($c[7] - $b[7]);      # calculate the diffs
    my $zkj = ($c[8] - $b[8]);
    my $xkl = ($c[6] - $d[6]);      # calculate the diffs
    my $ykl = ($c[7] - $d[7]);      # calculate the diffs
    my $zkl = ($c[8] - $d[8]);
         







   $dxi = $yij * $zkj - $zij * $ykj;     
   $dyi = $zij * $xkj - $xij * $zkj;
   $dzi = $xij * $ykj - $yij * $xkj;
   $gxi = $zkj * $ykl - $ykj * $zkl;    
   $gyi = $xkj * $zkl - $zkj * $xkl;
   $gzi = $ykj * $xkl - $xkj * $ykl;

   $bi = $dxi * $dxi + $dyi * $dyi + $dzi * $dzi;
   $bk = $cxi * $gxi + $gyi * $gyi + $gzi * $gzi;
   $ct = $dxi * $gxi + $dyi * $gyi + $dzi * $gzi;

   $boi2 = 1/$bi;
   $boj2 = 1/$bk;
   
   $bi   = sqrt($bi);
   $bk   = sqrt($bk);

   $z1   = 1/$bi;
   $z2   = 1/$bk;
   $bioj = $bi * $z2;
   $bjoi = $bk * $z1;
   $ct   = $ct * $z1 * $z2;
   if ($ct >  1.0) {  $ct = 1.0; }
   if ($ct < (-1.0)) {$ ct = -1.0;}
   $ap   = acos($ct);

   $s = $xkj * ($dzi * $gyi - $dyi * $gzi)
     + $ykj * ($dxi * $gzi - $dzi * $gxi)
     + $zkj * ($dyi * $gxi - $dxi * $gyi);

   if ($s < 0){ $ap = - $ap; }

   $ap = ($ap > 0.0) ? $PI-$ap : -($PI+$ap);


   $ap *= 180/3.142 ;
    return "$a[3]-$b[3]-$c[3]-$d[3] \t $ap";

}


$count_of_alanine=0;
$count_of_arginine=0;  
$count_of_asparagine=0;
$count_of_aspartic_acid=0;
$count_of_cysteine=0;
$count_of_glutamic_acid=0;
$count_of_glutamine=0;
$count_of_glycine=0;
$count_of_histidine=0;
$count_of_isoleucine=0;
$count_of_leucine=0;
$count_of_lysine=0;
$count_of_methionine=0; 
$count_of_phenylalanine=0;
$count_of_proline=0;
$count_of_serine=0;
$count_of_threonine=0;
$count_of_tryptophan=0;
$count_of_tyrosine=0;
$count_of_valine=0;

while (<>) {
    push @dA, $_;            # add line to buffer
    next if @dA < 2;         # skip unless buffer is full
    $s= proc(@dA) . "\n";   # process and print 
    push(@dist, "$s");    
    shift @dA;               # remove used line 
}
print OUTFILE @dist;
close OUTFILE;



   