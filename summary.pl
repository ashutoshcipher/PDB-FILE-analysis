#!/usr/bin/perl

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
for ($line = 0; $line < scalar @dataArray; $line++) 
{
   
   if ($dataArray[$line]=~/^ATOM\s+(\d+)\s+(.*?)$/) 
      {
        $an = $1;
     }  
   
   if ($dataArray[$line]=~/^MODEL\s+(.*?)$/) 
      {
        $MODEL = $1 , "\n";
     }  

if ($dataArray[$line]=~/^HELIX\s+(\d+)\s+(\d+)\s+(\w{3})\s(\w+)\s+(\d+)\s+(\w{3})\s(\w+)\s+(\d+)\s+(\d+)\s+(\d+).*?/ig) 
      {
       $helix++; 
       $helix_infor = $helix . " helix starts " . $3 . " and end " . $6 . " of length " . $10 . "\n";
      # print $helix_infor;
      
    push(@helixs, "$helix_infor");
      } 
 if ($dataArray[$line]=~/^SHEET\s+(1)\s+(\w+)\s+(\d+).*?/ig)
      {
        $sheet_inform = $s . " sheet has " . $3 . " stands " . "\n"; 
      # print $sheet_inform;
        $s++;  
      push(@sheets, "$sheet_inform");
    
      }
if ($dataArray[$line]=~/^SSBOND\s+(\d+).*?/ig)
      {
        $ssbond =$1;
      }

  if ($dataArray[$line]=~/^HEADER\s+(.*?)$/)
      {
        $header = $1;    
      }
  if ($dataArray[$line]=~/^TITLE\s+(.*?)$/) 
      {
        $title = $1;
     }

   if ($dataArray[$line]=~/^SEQRES\s+\d+\s+\w+\s+(\d+)\s+(.*+)/) 
      {
       # print $1 , "\t";
   my @words = split / /, $2;
   push @finalseq, @words;
     }  


}

foreach $3 (@finalseq)
{

  if($3 eq "ALA"){
       $count_of_alanine++;
                      }
       if($3 eq "ARG"){
       $count_of_arginine++;
       }
       if($3 eq "ASN"){
       $count_of_asparagine++;
       }
       if($3 eq "ASP"){
       $count_of_aspartic_acid++;
       }
       if($3 eq "CYS"){
        $count_of_cysteine++;
       }
       if($3 eq "GLU"){
       $count_of_glutamic_acid++;
       }
       if($3 eq "GLN"){
       $count_of_glutamine++;
       }
       if($3 eq "GLY"){
       $count_of_glycine++;
       }
       if($3 eq "HIS"){
       $count_of_histidine++;
       }
       if($3 eq "ILE"){
       $count_of_isoleucine++;
       }
       if($3 eq "LEU"){
       $count_of_leucine++;
       }
       if($3 eq "LYS"){
       $count_of_lysine++;
       }
       if($3 eq "MET"){
       $count_of_methionine++;
       }
       if($3 eq "PHE"){
       $count_of_phenylalanine++;
       }
       if($3 eq "PRO"){
       $count_of_proline++;
       }
       if($3 eq "SER"){
       $count_of_serine++;
       }
       if($3 eq "THR"){
       $count_of_threonine++;
       }
       if($3 eq "TRP"){
       $count_of_tryptophan++;
       }
       if($3 eq "TYR"){
       $count_of_tyrosine++;
       }
       if($3 eq "VAL"){
       $count_of_valine++;
       }

}
$total_count= $count_of_alanine + $count_of_arginine + $count_of_asparagine +
$count_of_aspartic_acid + $count_of_cysteine + $count_of_glutamic_acid + $count_of_glutamine + $count_of_glycine + $count_of_histidine + $count_of_isoleucine + $count_of_leucine + $count_of_lysine + $count_of_methionine + $count_of_phenylalanine + $count_of_proline + $count_of_serine + $count_of_threonine + $count_of_tryptophan + $count_of_tyrosine + $count_of_valine ;
$ tt= @finalseq;
#print "@helixs";
$outputFile = "$ARGV[1]";
open (OUTFILE, ">$outputFile");
print OUTFILE "\t", $header, "\n";
print OUTFILE $title, "\n";
print OUTFILE "-----------------------------------------------------------------------\n";
print OUTFILE "Amino acid\tTotal Number(N)\t\n";
print OUTFILE "Alanine\t\t", $count_of_alanine, "\t\t\n";
print OUTFILE "Arginine\t", $count_of_arginine, "\t\t\n";
print OUTFILE "Asparagine\t", $count_of_asparagine, "\t\t\n";
print OUTFILE "Aspartic Acid\t", $count_of_aspartic_acid, "\t\t\n";
print OUTFILE "Cysteine\t", $count_of_cysteine, "\t\t\n";
print OUTFILE "Glutamic Acid\t",$count_of_glutamic_acid, "\t\t\n";
print OUTFILE "Glutamine\t",$count_of_glutamine, "\t\t\n";
print OUTFILE "Glycine\t\t",$count_of_glycine, "\t\t\n";
print OUTFILE "Histidine\t",$count_of_histidine, "\t\t\n";
print OUTFILE "Isoleucine\t",$count_of_isoleucine, "\t\t\n";
print OUTFILE "Leucine\t\t",$count_of_leucine, "\t\t\n";
print OUTFILE "Lysine\t\t",$count_of_lysine, "\t\t\n";
print OUTFILE "Methionine\t",$count_of_methionine, "\t\t\n";
print OUTFILE "Phenylalanine\t",$count_of_phenylalanine, "\t\t\n";
print OUTFILE "Proline\t\t",$count_of_proline, "\t\t\n";
print OUTFILE "Serine\t\t",$count_of_serine, "\t\t\n";
print OUTFILE "Threonine\t",$count_of_threonine, "\t\t\n";
print OUTFILE "Tryptophan\t",$count_of_tryptophan, "\t\t\n";
print OUTFILE "Tyrosine\t",$count_of_tyrosine, "\t\t\n";
print OUTFILE "Valine\t\t",$count_of_valine, "\t\t\n";
print OUTFILE "-----------------------------------------------------------------------\n";
print OUTFILE "Total Number of Residue\t",$tt, "\t\t\n";
print OUTFILE "Total Number of atoms\t",$an, "\t\t\n";
print OUTFILE "Total MODELS\t",$MODEL, "\t\t\n";
print OUTFILE "\n";
print OUTFILE "-----------------------------------------------------------------------\n";
print OUTFILE "Helix information is below:- \n";
print OUTFILE @helixs;
print OUTFILE "\n";
print OUTFILE "-----------------------------------------------------------------------\n";
print OUTFILE "Sheets information is below:- \n";
print OUTFILE @sheets;
print OUTFILE "-----------------------------------------------------------------------\n";
print OUTFILE "Total SS bonds \t",$ssbond, "\t\t\n";

open (FH, ">>residue_count.csv") or die "$!";
print FH "alanine, arginine, asparagine, aspartic_acid, cysteine, glutamic_acid, glutamine, glycine, histidine, isoleucine, leucine, lysine, methionine, phenylalanine, proline, serine, threonine, tryptophan, tyrosine, valine\n";
print FH qq|$count_of_alanine,$count_of_arginine,$count_of_asparagine,$count_of_aspartic_acid,$count_of_cysteine,$count_of_glutamic_acid,$count_of_glutamine,$count_of_glycine,$count_of_histidine,$count_of_isoleucine,$count_of_leucine,$count_of_lysine,$count_of_methionine,$count_of_phenylalanine,$count_of_proline, $count_of_serine,$count_of_threonine,$count_of_tryptophan,$count_of_tyrosine,$count_of_valine\n|; 

