# Reproducing

## File Structure

```shell
.
├── gcov_dump.sh             # Script used to execute __gcov_dump
├── gcov_dump_one.sh         # Script used to execute __gcov_dump_one
├── my_files                 # The files and results of the tests I conducted
├── nginx-1.23.1             # The nginx I'm using
├── nginx.conf               # configuration for nginx
├── test                     # my test code
└── t-reqs                   # t-reqs after adjusted
```

## Test Code Experiment

I executed the following commands in sequence in `HTTP-Fuzzing-Intership/` to run the test program.

```shell
cd ./test
gcc --coverage -O0 test.c -o testcode
./testcode
```

Then I input `1` to `5` in sequence and execute `gcov_dump_one.sh` then use `gcovr` to get the result of the execution after each entry. 

```shell
sh ./gcov_dump_one.sh
gcovr --html -o 1.html
```

## Nginx Experiment

I executed the following commands in sequence in `HTTP-Fuzzing-Intership/nginx-1.23.1/` to get the Nginx program.

```shell
./configure --prefix="/path/to/install/" --with-cc=gcc --with-cc-opt="--coverage" --with-ld-opt="--coverage"
make
make install
```

Please replace the configuration file in the Nginx installation directory with `nginx.conf` in the root directory.

Then I configured the `T-reqs` without any additional action on your part. 

Please run the server and use `gcovr` once using the following commands.

```shell
cd /HTTP-Fuzzing-Intership/nginx-1.23.1/objs
./nginx
gcovr --html -o 1.html
```

Then please use the following command to run the feedback server and do fuzz (for the sake of time, only one round is carried out, about a few seconds).

```shell
cd /HTTP-Fuzzing-Intership/t-reqs/code
python3 ./feedback-server.py
python3 main.py -c ../full_config
```

Finally, please use the following command again in `/HTTP-Fuzzing-Intership/nginx-1.23.1/objs/` to get the code coverage.

```shell
sh ../../gcov_dump.sh 82
gcovr --html -o 2.html
```



