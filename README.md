Beaglebone: sensor control
==
CS 111: Operating System Principles  
Summer 2018
  
  
Included files:
* src.c - source code in C-language for BBG embedded system that reads/prints
  	    temperature, takes commands from stdin, and prints the response of
	    command with current local time.
* Makefile - contains the following targets:
  	     build (default), check (smoke-tests: invalid-option run
	     and normal run), clean, and dist  

Credits:
* MRAA Documentation - https://iotdk.intel.com/docs/master/mraa/
* GPOI Tutorial -
  https://drive.google.com/drive/folders/0B6dyEb8VXZo-N3hVcVI0UFpWSVk
* Linux man pages online - http://man7.org/linux/man-pages/index.html
* How to use Here-Doc in Makefile -
  https://stackoverflow.com/questions/35516379/makefile-recipe-with-a-here-document-redirection/35517304