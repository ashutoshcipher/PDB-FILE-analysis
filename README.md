# PDB-FILE-analysis
 Description of each program is given below:-

1. summary.pl :- It will make a summary file of pdb. 

    Input from terminal :- summary.pl pdbfilename.pdb outputfilename.txt

2. Calpha_file_making.pl :-  It will make a file having information about C-alpha. This file will  
    be used by other programs(angle.pl, dihedral.pl. distance.pl ) as its input file. The output
   file from this program will be used by the 3rd ,4th and 5th program as its input file.

     Input from terminal :- Calpha_file_making.pl pdbfilename.pdb outputfilename.txt

3. angel.pl :-  It will calculate the angle between the three consecutive C-alpha atoms. It will
    will take input file  which formed the Calpha_file_making.pl output file.
   
     Input from terminal :- angel.pl calpha_outputfile.txt  outputfilename.txt

4. distance. pl :- It will calculate the distance between the two consecutive C-alpha atoms. It 
   will take input file  which formed the Calpha_file_making.pl output file.

     Input from terminal :- distance.pl calpha_outputfile.txt  outputfilename.txt

5. dihedral.pl :- It will calculate the dihedral angle between the four consecutive C-alpha.
    atoms. It will take input file  which formed the Calpha_file_making.pl output file.

     Input from terminal :- dihedral.pl calpha_outputfile.txt  outputfilename.txt

6. gapfind.pl :- It will find out the gaps. Output file will be showing alignment. 

     Input from terminal :- dihedral.pl pdbfilename.pdb  outputfilename.tx
