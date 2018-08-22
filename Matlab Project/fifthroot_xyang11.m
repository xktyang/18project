function [ y ] = fifthroot_xyang11(P)
% ///XIN KAI YANG///fifthroot_xyang11 finds fifthroot of P using Newton's
% Method.
% input: P: value to calculate the fifth root of
% output- y: the fifth root calculation.
x=P; %first estimate
x2=x-(((x^5)-P)/(5*(x^4))); %second estimate
    function [xk]=nested(x2) %xk final estimate, x2 second estimate
        xm=[x2,zeros(1,1)];
        for i=1:2  %28 gives answer
            xm(1,i+1)=xm(1,i)-((xm(1,i)^5-P)/(5*xm(1,i)^4));
        end
        while abs((xm(1,end)-xm(1,end-1))/xm(1,end-1)) > 1e-5
            for i=1:2
            xm(1,end+1)=xm(1,end-1)-((xm(1,end-1)^5-P)/(5*xm(1,end-1)^4));
            end
        end
        xk=xm(1,end);
    end
y=nested(x2);
end
%     IGNORE
%      
%         xm=[x2, zeros(1,1)];
%         for i=1:2
%             xm(1,i)=
%         
%         while abs((xk-x)/x) > 1e-5
%             xk=zeros(1,2);
%             for i=1:2
%                 x=x-(((x^5)-P)/(5*(x^4)));
%             end
%             x=x;
%         end
%     end
% y=xk;
% end
% E=abs(((x-((x^5)-P)/(5*(x^4)))-x(k))/x(k));
% while abs(((x-((x^5)-P)/(5*(x^4)))-x(k))/x(k)) > 1e-5
%     
% end
%function [x(k+1]=B(x(k))
            %Function B calculates x(k+1)
%             x(k+1)=x(k)-(((x(k)^5)-P)/(5*(x(k)^4)));
%             end
            
         