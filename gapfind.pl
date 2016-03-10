#!/usr/bin/perl

open(DATA, "$ARGV[0]") or die "Couldn't open file file.txt, $!";
chomp(@dataArray = <DATA>);
close(DATA);
$s=1;
$flag=0;
$a=0;
$an=0;
$MODEL=1;
$strand =  "A";
$amino =0;
$cnt =0;
$outputFile = "$ARGV[1]";
open (OUTFILE, ">$outputFile");
for ($line = 0; $line < scalar @dataArray; $line++) 
{

   if ($dataArray[$line] =~ m/^ATOM\s+(\d+)\s+(\w+)\s+(\w+)\s(\w+)\s+(\d+).*?/ig)
        
       {         
       $an++;
                    if($4 gt $strand){
                    $amino = 0;
                    $strand = $4;
                    $flag = 1;      }
      
                    if(($5 > $amino)&&($strand eq $4)){   
                     push @final, $3;
                    $cnt++;
                     $sub = $5 - $amino;

                           if($sub>1 && $flag!=1 && $amino!=0) 
                          {  
                          $gap =$sub - 1; 
                          #print " Gap of ". $gap . " " . $residue . " and " . $3. " at "." $amino". "\n"; 
}  
                   $amino = $5;
                   $residue = $3;
                   $a++;
                    $flag =0;
                                                     }
       }

if ($dataArray[$line] =~ m/^HETATM\s+(\d+)\s+(CA)\s+(\w+)\s(\w+)\s+(\d+).*?/ig)
        
       {         
       $an++;
                    if($4 gt $strand){
                    $amino = 0;
                    $strand = $4;
                    $flag = 1;      }
      
                    if(($5 > $amino)&&($strand eq $4)){   
                     push @final, $3;
                    $cnt++;
                     $sub = $5 - $amino;

                           if($sub>1 && $flag!=1 && $amino!=0) 
                          {  
                          $gap =$sub - 1; 
                          print " Gap of ". $gap . " " . $residue . " and " . $3. " at "." $amino". "\n"; }  
                   $amino = $5;
                   $residue = $3;
                   $a++;
                    $flag =0;
                                                     }
       }

}
#print @final;
        print "\n";

        print "\n";
        print OUTFILE "Header" . "\t" . "Coordinate" . "\t" . "Residue number". "\n"; 
for ($line = 0; $line < scalar @dataArray; $line++) 
{

   if ($dataArray[$line]=~/^SEQRES\s+\d+\s+\w+\s+(\d+)\s+(.*+)/) 
      {
       # print $1 , "\t";
   my @words = split / /, $2;
   push @finalseq, @words;
     #print $words[0];
       # print $2;
        #print "\n";
     }  
}
#print @finalseq;


for ($line = 0, $line1 = 0; $line < scalar @final , $line1 < scalar @finalseq ; $line1++) 
{
    if( $finalseq[$line1] eq  $final[$line]) {
        print OUTFILE $finalseq[$line1] . "\t" .$final[$line].  "\t\t" . ($line1 + 1). "\n" ; 
        $line++;                             }

     else {
    print OUTFILE $finalseq[$line1] . "\t..." . "\t\t" . ($line1 + 1) . "\n" ;

}  

}






 