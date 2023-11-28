CPATH=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission 2> gitClone.txt
echo 'Finished cloning'

files=`find student-submission/*.java`

if [[ ! -e $files ]]
then
    echo 'Submission is not a file'
    exit
fi

# echo 'test'

cp $files grading-area
cp TestListExamples.java grading-area

cd grading-area

javac -cp $CPATH *.java 2> error.txt

if [[ $? -ne 0 ]]
then
    echo 'compiling error'
    exit
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test-result.txt

passresult=`grep "OK" test-result.txt`
if [[ $passresult != "" ]]
then 
	echo $passresult
else
	echo `grep "Tests run:" test-result.txt`
fi



# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
