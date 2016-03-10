#!/usr/bin/perl
use Statistics::R ;
use CGI qw(:standard);
use DBI;
use DBD::CSV;
open(DATA, "$ARGV[0]") or die "Couldn't open file file.txt, $!";
chomp(@dataArray = <DATA>);
close(DATA);
@helixs="";
@sheets="";
$s=1;
$a=0;
$an=0;
$MODEL=1;
$ssbond=0;
$strand =  "A";
$amino =0;
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

$outputFile = "$ARGV[1]";
open (OUTFILE, ">$outputFile");
for ($line = 0; $line < scalar @dataArray; $line++) 
{


   if ($dataArray[$line] =~ m/\w+\s+(\d+)\s+(CA)\s+(\w{3})\s(\w+)\s+(\d+).*?/ig)
        
    {  
       $an++;
      if($4 gt $strand){
       $amino = 0;
      $strand = $4;
       }
      
      if(($5 > $amino)&&($strand eq $4))
   {   

    print OUTFILE $dataArray[$line] , "\n";
     $ sub = $5 - $amino;
       #print $strand;
       #print  " ";
       $amino = $5;
       $a++;
       #print $a;
       #print  " ";
       #print $3;
      
     
     }
}

}

close (OUTFILE);



   