#!/bin/bash
echo start

# specify directory of files to evaluate
DIR_files="audio/to_evaluate"

# specify directory of original files
DIR_original="audio/original"

for file in `ls $DIR_files`
do

	# what is the correct sound file?
	sound=`cut -d "." -f 1 <<< "$file"`
	sound=`echo "$sound" | rev | cut -d '_' -f 1 | rev`

	# specify path to current signal
	PATH_file=$DIR_files"/"$file

	# specify path to original signal
	PATH_original=$DIR_original"/original_$sound.wav"
	
	# calculate PESQ metric
	bin/pesq +8000 $PATH_original $PATH_file

done

# rename results file name to include time of evaluation
dateofeval=`date +%Y%m%d_%H%M`	
mv "results/PESQ_scores.txt" "results/PESQ_scores_$dateofeval.txt"
