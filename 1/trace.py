import math


print(bin(0)[2:].zfill(1)[-1:],end='')	#clk
print(bin(1)[2:].zfill(1)[-1:],end='')  #reset
print(bin(0)[2:].zfill(1)[-1:],end='')	#start
print(bin(0)[2:].zfill(10)[-10:],end='')	#a
print(bin(0)[2:].zfill(10)[-10:],end='')	#b
print(' ',end='')
print(bin(0)[2:].zfill(1)[-1:],end='')	#done
print(bin(0)[2:].zfill(10)[-10:],end='') #output
print(' ',end='')
print(bin(0)[2:].zfill(11)[-11:],end='\n')

print(bin(1)[2:].zfill(1)[-1:],end='')	#clock
print(bin(1)[2:].zfill(1)[-1:],end='')  #reset
print(bin(0)[2:].zfill(1)[-1:],end='')	#start
print(bin(0)[2:].zfill(10)[-10:],end='')	#a
print(bin(0)[2:].zfill(10)[-10:],end='')	#b
print(' ',end='')
print(bin(0)[2:].zfill(1)[-1:],end='')	#done
print(bin(0)[2:].zfill(10)[-10:],end='') #output
print(' ',end='')
print(bin(0)[2:].zfill(11)[-11:],end='\n')

######################################################

a = [10, 32,3,345,130,144,240,3,1,5];
b = [4,8,5,2,45,12,10,3,5,4];
for i in range(len(a)):
	for j in range(2*(math.floor(a[i]/b[i])+3)):
		if(j%2==0):
			print(bin(0)[2:].zfill(1)[-1:],end='')	#clock
		else:
			print(bin(1)[2:].zfill(1)[-1:],end='')	#clock
		print(bin(0)[2:].zfill(1)[-1:],end='')  	#reset
		if(j == 0):
			print(bin(1)[2:].zfill(1)[-1:],end='')	#start
		elif(j == 1):
			print(bin(1)[2:].zfill(1)[-1:],end='')	#start
		else:
			print(bin(0)[2:].zfill(1)[-1:],end='')	#start
		print(bin(a[i])[2:].zfill(10)[-10:],end='')	#a
		print(bin(b[i])[2:].zfill(10)[-10:],end='')	#b
		print(' ',end='')
		if(j == 2*(math.floor(a[i]/b[i])+3)-1):
			print(bin(1)[2:].zfill(1)[-1:],end='')	#done
		else:
			print(bin(0)[2:].zfill(1)[-1:],end='')	#done
		if(a[i]<b[i]):
			print(bin(0)[2:].zfill(10)[-10:],end='')#q
		else:
			if(j == 2*(math.floor(a[i]/b[i])+3)-1):
				print(bin(math.floor(a[i]/b[i]))[2:].zfill(10)[-10:],end='')			#q
			elif(j<5):
				print(bin(0)[2:].zfill(10)[-10:],end='')					#q
			else:
				print(bin(max(0,math.floor((j-5)/2 + 1)))[2:].zfill(10)[-10:],end='')		#q
		
		print(' ',end='')
		#if(j == 1):
			#print(bin(0)[2:].zfill(11)[-11:],end='\n')
		if(j%2==0):
			print(bin(0)[2:].zfill(11)[-11:],end='\n')
		else:
			print(bin(2047)[2:].zfill(11)[-11:],end='\n')
