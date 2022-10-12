#!/bin/bash
exception="./exceptions.txt"
path="./slides"
lastModification=600 #minutes from the last modification
SpellingError () {
    error=0;
    echo "";
    echo "Searching for spelling mistakes in" $1":";
    n_line=1; 
    while IFS= read -r line
    do
        resultado=$(echo $line | aspell --mode=tex  --lang=en --list | aspell --mode=tex  --lang=es --list --home-dir=. --personal=$exception);
        if [[ ! -z "$resultado" ]]
        then 
         echo "Spell error in line $n_line : $resultado" 
         let "error = 1";
        fi
        let "n_line += 1"
    done < $1
    return $error; 
}
export -f SpellingError; 
exitValue=0
# Testing readme
SpellingError README.md
let "exitValue += $?"
# Files *.tex
for file in $(find $path -name "*.tex" -mmin -$lastModificaction)
do 
    SpellingError $file; 
    let "exitValue += $?"
done


exit $exitValue; 