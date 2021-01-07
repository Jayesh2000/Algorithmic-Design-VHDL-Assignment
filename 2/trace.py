print(bin(1)[2:].zfill(1)[-1:],end='')	#reset
print(bin(1)[2:].zfill(1)[-1:],end='')  #start
print(bin(0)[2:].zfill(1)[-1:],end='')	#clock
print(bin(0)[2:].zfill(8)[-8:],end='')	#a
print(bin(0)[2:].zfill(8)[-8:],end='')	#b
print(' ',end='')
print(bin(0)[2:].zfill(1)[-1:],end='')	#done
print(bin(0)[2:].zfill(16)[-16:],end='') #output
print(' ',end='')
print(bin(0)[2:].zfill(17)[-17:],end='\n')

print(bin(1)[2:].zfill(1)[-1:],end='')
print(bin(1)[2:].zfill(1)[-1:],end='')
print(bin(1)[2:].zfill(1)[-1:],end='')
print(bin(0)[2:].zfill(8)[-8:],end='')
print(bin(0)[2:].zfill(8)[-8:],end='')
print(' ',end='')
print(bin(0)[2:].zfill(1)[-1:],end='')
print(bin(0)[2:].zfill(16)[-16:],end='')
print(' ',end='')
print(bin(0)[2:].zfill(17)[-17:],end='\n')

####################################################


######################################################


for i in range(128):
	for j in range(128):
		for k in range(20):
			print(bin(0)[2:].zfill(1)[-1:],end='')

			if(k==0):
				print(bin(1)[2:].zfill(1)[-1:],end='')
			elif(k==1):
				print(bin(1)[2:].zfill(1)[-1:],end='')	
			else:
				print(bin(0)[2:].zfill(1)[-1:],end='')

			if(k%2 ==0):
				print(bin(0)[2:].zfill(1)[-1:],end='')
			elif(k%2 ==1):
				print(bin(1)[2:].zfill(1)[-1:],end='')

			print(bin(i)[2:].zfill(8)[-8:],end='')
			print(bin(j)[2:].zfill(8)[-8:],end='')
			print(' ',end='')

			if(k==17):
				print(bin(1)[2:].zfill(1)[-1:],end='')	
			elif(k==18):
				print(bin(1)[2:].zfill(1)[-1:],end='')	
			else:
				print(bin(0)[2:].zfill(1)[-1:],end='')

			print(bin(i*j)[2:].zfill(16)[-16:],end='')
			print(' ',end='')

			if(k==17):
				print(bin(131071)[2:].zfill(17)[-17:],end='\n')
			elif(k==18):
				print(bin(131071)[2:].zfill(17)[-17:],end='\n')	
			elif(k==19):
				print(bin(131071)[2:].zfill(17)[-17:],end='\n')	
			else:
				print(bin(0)[2:].zfill(17)[-17:],end='\n')




