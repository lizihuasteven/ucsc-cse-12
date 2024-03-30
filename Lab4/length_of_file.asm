length_of_file:
#function to find length of data read from file
#arguments: a1=bufferAdress holding file data
#return file length in a0
	
#Start your coding here


 li a0,0


 	li t0,0
	li a0,0
file_CMP_Empty:
	lbu t4,0(a1)
	bnez t4,fileCntLoop
	ret
fileCntLoop:
  addi a0,a0,1
  addi a1,a1,1
  j  file_CMP_Empty
#######################end of length_of_file###############################################	
