classdef ImgClass  
    properties
      Value
   end
    methods
        function r=SeparateRGB(obj,img,n)
            switch n
                case 'R'
                    r = img(:,:,1);
                case 'G'
                    r = img(:,:,2);        
                case 'B'
                    r = img(:,:,3);
            end
        end
        function r=CombineRGB(obj,imgR,imgG,imgB)
            r=cat(3,imgR,imgG,imgB);
        end       
    end
end
