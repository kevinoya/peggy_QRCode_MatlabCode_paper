%  FSED + data hiding  (41x41 data in 111x111 image)  2016-09-23
%
%  input  y: 123x123 grayscale image
%         dat:  123x123 QR-code binary data ( 0/1 : data; 2 : background)
%
%  usage: y3=myFMDH111(y,dat);
%
function y3=myFMDH111(y,dat);

 dat= double(1)-double(dat);
y1=(1-double(y)/255);
y2=zeros(123+2,123+2); % 125x125
y2(2:124,2:124)=y1;
for i=2:124
    if rem(i,2)==0    % 雙數行
        for j=2:124
            if dat(i-1,j-1) ~=  -1 %((rem(i,3)==0) & (rem(j,3)==0))
                error=y2(i,j) - double(dat( i-1,j-1));
                y2(i,j)=dat(i-1,j-1);
                %y2(i,j)=dat( (i-3)/3+1,(j-3)/3+1);
                y2(i,j+1)=y2(i,j+1)+7/16*error;
                y2(i+1,j+1)=y2(i+1,j+1)+1/16*error; 
                y2(i+1,j)=y2(i+1,j)+5/16*error;
                y2(i+1,j-1)=y2(i+1,j-1)+3/16*error;
            else
            if y2(i,j) > 0.5
                error=y2(i,j)-1;
                y2(i,j)=1;
                y2(i,j+1)=y2(i,j+1)+7/16*error;
                y2(i+1,j+1)=y2(i+1,j+1)+1/16*error; 
                y2(i+1,j)=y2(i+1,j)+5/16*error;
                y2(i+1,j-1)=y2(i+1,j-1)+3/16*error;
            else
                error=y2(i,j);
                y2(i,j)=0;
                y2(i,j+1)=y2(i,j+1)+7/16*error;
                y2(i+1,j+1)=y2(i+1,j+1)+1/16*error; 
                y2(i+1,j)=y2(i+1,j)+5/16*error;
                y2(i+1,j-1)=y2(i+1,j-1)+3/16*error;
            end
            end
        end
        
    else
     for j=124:-1:2        % 單數行
         if  dat(i-1,j-1) ~=  -1  %(rem(i,3)==0) & (rem(j,3)==0)
                error=y2(i,j) - double(dat( i-1,j-1));
                y2(i,j)=dat(i-1,j-1);
                %y2(i,j)=dat( (i-3)/3+1,(j-3)/3+1);
                y2(i,j-1)=y2(i,j-1)+7/16*error;
                y2(i+1,j-1)=y2(i+1,j-1)+1/16*error; 
                y2(i+1,j)=y2(i+1,j)+5/16*error;
                y2(i+1,j+1)=y2(i+1,j+1)+3/16*error;
         else
             if y2(i,j) > 0.5
                error=y2(i,j)-1;
                y2(i,j)=1;
                y2(i,j-1)=y2(i,j-1)+7/16*error;
                y2(i+1,j-1)=y2(i+1,j-1)+1/16*error; 
                y2(i+1,j)=y2(i+1,j)+5/16*error;
                y2(i+1,j+1)=y2(i+1,j+1)+3/16*error;
             else
                error=y2(i,j);
                y2(i,j)=0;
                y2(i,j-1)=y2(i,j-1)+7/16*error;
                y2(i+1,j-1)=y2(i+1,j-1)+1/16*error; 
                y2(i+1,j)=y2(i+1,j)+5/16*error;
                y2(i+1,j+1)=y2(i+1,j+1)+3/16*error;
             end
          end
        end    
        
    end
end
y3=logical(~y2(2:124,2:124));
% figure(5),imshow(y3);title('FSED +error diffusion');

% data retrieval
%
%kk=~y3(2:3:111,2:3:111);

%result=(kk==dat);
%sum(sum(result));
