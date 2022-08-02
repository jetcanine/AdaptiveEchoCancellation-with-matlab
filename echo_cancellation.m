
clc
clear all
close all
tts('Welcome to LMS based Echo Cancellation Technique');
pause(1);
[x,Fs] =audioread('final.wav');  
 sound(x,Fs);  
   pause(2);  
tts('Here is the Original input signal');
pause(1);
 t=0:1/Fs:(length(x)-1)/Fs;
  subplot(4,1,1);
  plot(t,x,'b');
  title('original signal')


 snr=4;

for i=1:5000
    for j=1:2
        k=zeros(i,j);
    end
end
y=[k;x]

   %sound(y,Fs);
   subplot(4,1,2)
   plot(y,'b')
   
   for i=1:10000
    for j=1:2
        l=zeros(i,j);
    end
end
   
   y1=[l;x]
   %sound(y1,Fs);
   subplot(4,1,3)
   plot(y1,'b')
   
     
   for i=1:20000
    for j=1:2
        m=zeros(i,j);
    end
end
   
   y2=[m;x]
   %sound(y2,Fs);
   subplot(4,1,4)
   plot(y2,'b')
   
   [rx cx]=size(x); 
   [ry cy]=size(y);
   [ry1 cy1]=size(y1); 
   [ry2 cy2]=size(y2); 
        
   for i=1:ry2-rx
    for j=1:2
        x_z=zeros(i,j);
    end
   end
   
   
     for i=1:ry2-ry
    for j=1:2
        y_z=zeros(i,j);
    end
   end
   
      for i=1:ry2-ry1
    for j=1:2
        y1_z=zeros(i,j);
    end
   end


   
   x=[x;x_z];
   y=[y;y_z];
   y1=[y1;y1_z];
       
   for i=10000:ry2
    for j=1:cy2
         y3(i,j)=x(i,j)+y(i,j)+y1(i,j)+y2(i,j);
    end
end
 pause(1);  
  

   sound(y3,Fs);
   figure, plot(y3,'b')
   title('original+echo');
    pause(1);  
  
   tts('Generated Echo input signal');
pause(2);
   

   d =x; 
mu=0.05; 

 for i=1:ry2
    for j=1:2
        w=zeros(i,j);
    end
 end


   for i=1:ry2
    for j=1:2
    % predict next sample and error 
    y_op(i,j) = w(i,j)'*y3(i,j); 
    e(i,j)  = d(i,j) - y3(i,j); 
    % adapt weight matrix and step size 
    w(i,j) = w(i,j) + mu *y3(i,j)*conj(e(i,j)); 
    end  
   end
  
    for i=1:ry2
    for j=1:2
    
    y4(i,j) = w(i,j)'*y3(i,j); 
    end  
    end
     pause(1);  
   
   sound(y4,Fs);
   figure, plot(y4,'b')
   title('Recovered Output');
   tts('Here is the Signal after Echo Cancellation');
pause(2);
  
 
