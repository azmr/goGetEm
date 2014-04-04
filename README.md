goGetEm
========

`goGetEm` is a small collection of shell scripts for managing your *Go*packages.


Uses
----

There are a couple of things it is useful for:

	1. "Backing up" your src files in a way that doesn't take up much space, so that you can quickly get your Go files up and running on new workstations.
	2. Easily sharing the go packages you use with others.
	3. Keeping your go packages up to date without hassle. `goGetUp.sh`could be set as a cron job to make this even less effort.


The Scripts
-----------

`goGetMe.sh` creates a newline delimited list of packages from the files in your $GOPATH/src folder and saves this in a file called `goGot`.

`goGetEm.sh` runs `go get -u $package` on all the packages listed in `goGot`.

`goGetUp.sh` is a small wrapper around the two previous scripts that *go gets* any packages in `goGot` that are not in the $GOPATH/src folder and updates the rest that are.


Setup
-----

	1. Make sure that your $GOPATH environment variable is set. See the [golang code reference page][1] for more details and instructions on how to do this.
	2. `git clone https://github.com/azmr/goGetEm` in whichever directoy you would like it to live. I keep mine in $GOPATH/src.
	Alternatively, fork this repo, so that you always have your goGot under a VCS.
	3. Run whichever scripts need running, e.g `./goGetMe`.
	4. Keep the goGot file in a safe place for when you next need it.
[1]: http://golang.org/doc/code.html#GOPATH


Go get 'em tiger.
