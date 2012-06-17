import re
import sys
regexs={("[A-Fa-f0-9]{32}","MD2, MD4, MD5, NTLM or RIPEMD-128"),
("[A-Fa-f0-9]{40}","SHA160Bit(SHA1),SQL 4.x or RIPEMD-160"),
("[A-Fa-f0-9]{64}","SHA 256Bit(Unix)"),
("[A-Fa-f0-9]{98}","SHA 384Bit"),
("[A-Fa-f0-9]{130}","SHA 512Bit(Unix)"),
("[A-Fa-f0-9]{16}","LM, VNC or MySQL323"),
("^.{13}$","DES")}
if(len(sys.argv)>1):
	for i in regexs:
		if(re.search(i[0],sys.argv[1])):
			print i[1]
else:
	print "please provide your hash as a commandline arguement!"