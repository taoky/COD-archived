make clean

set -e
make
./bubble < random.txt > test.txt
diff test.txt answer.txt

echo "Test OK!"
