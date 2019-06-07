make clean

set -e
make -f Makefile.linux
./bubble < random.txt > test.txt
diff test.txt answer.txt

echo "Test OK!"
