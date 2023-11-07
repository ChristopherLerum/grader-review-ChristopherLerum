CPATH=".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar"

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

files=`find student-submission/*.java`

if [[ ! -e $files ]]
then
    echo 'Submission is not a file'
    exit
fi

echo 'test'

cp $files grading-area
cp TestListExamples.java grading-area

cd grading-area

javac -cp $CPATH *.java

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test-result.txt

result=`grep "OK" test-result.txt`
echo $result

if [[ $result == 'OK (1 test)' ]]
then
    echo 'You get a Pass'
    exit
fi


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
