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

  $max = 540;

  $firstTry = randInt($max);
  # $secondTry = $firstTry + (randomNegative() * randInt($max - rand($max) * rand(3)));
  $secondTry = $firstTry + (randomNegative() * randInt($firstTry - rand($firstTry) * rand(6)));
  $secondTry = $secondTry<0 ? abs($secondTry) : $secondTry; 

  print "\"$F[0]\",$firstTry,$secondTry";
  ' ${sourceFile} >> ${targetFile}
  unset -f ${FUNCNAME[0]}
}
buildScatterPlotData
