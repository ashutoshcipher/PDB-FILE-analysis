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
    my @c = split ' ', shift;   # line 2
    my $x1 = ($a[6] - $b[6]);      # calculate the diffs
    my $y1 = ($a[7] - $b[7]);      # calculate the diffs
    my $z1 = ($a[8] - $b[8]);
    my $x2 = ($c[6] - $b[6]);      # calculate the diffs
    my $y2 = ($c[7] - $b[7]);      # calculate the diffs
    my $z2 = ($c[8] - $b[8]);     

    $m = vector($x1, $y1, $z1);
    $n = vector($x2, $y2, $z2);
    $s = $m->norm . $n->norm;
    $g = acos($s);
        #print " \t ";

    $degrees  = rad2deg($g);

    #print $degrees;
    #print " \n ";
    return "$a[3]-$b[3]-$c[3]\t$degrees";
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



   