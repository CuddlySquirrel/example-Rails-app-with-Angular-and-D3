#!/bin/bash
function buildScatterPlotData(){
  declare -- headings='"Name","First Try","Second Try"'

  declare -- sourceDir='scripts/concerns'
  declare -- sourceBasename='word-list.txt';
  declare -- sourceFile="${sourceDir}/${sourceBasename}"

  declare -- targetDir='app/views/static'
  declare -- targetBasename="${sourceBasename%.txt}.csv";
  declare -- targetFile="${targetDir}/${targetBasename}"


  echo ${headings} > ${targetFile};

  perl -lna -e'
  sub randInt { (rand(shift)) }                # generates random integer from 0 to arg
  sub randomNegative { randInt(2)?1:-1; }      # random 1 or -1
  sub transitionVariance {
    $maxChoice = 8;
    $choice = rand($maxChoice);
    $choice >= $maxChoice*0.9 ? $maxVal : $firstTry;
  }

  $maxVal = 540;
  $downwardBias = 2;

  $firstTry = randInt($maxVal);
  
  $secondTry = $firstTry - (randomNegative() * (randInt($firstTry - rand(transitionVariance()) * rand($downwardBias))));
  $secondTry = $secondTry<0 ? abs($secondTry) : $secondTry; 
  
  print STDERR "$firstTry  $secondTry $chooseVar1";

  print "\"$F[0]\",$firstTry,$secondTry";
  ' ${sourceFile} >> ${targetFile}
  unset -f ${FUNCNAME[0]}
}
buildScatterPlotData
