#include<stdio.h>

int main(){
char a[10];
while(1){
scanf("%s", a);
printf("%s", a);
if(a[0]=='q')
break;
else if(a[0]=='1')
printf("%s", "print 1");
else if(a[0]=='2')
printf("%s", "print 2");
else if(a[0]=='3')
printf("%s", "print 3");
else if(a[0]=='4')
printf("%s", "print 4");
else if(a[0]=='5')
printf("%s", "print 5");
}
return 0;
}
