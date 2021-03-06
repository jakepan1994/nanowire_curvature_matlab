function re=maxsd(mu,delta,alpha)
t=25;
% vzm=sqrt(mu^2+delta^2);
vzm=((-alpha^2+2*t*mu)*sqrt(delta^2+mu^2)+sqrt(4*t*mu*alpha^2*(mu^2-delta^2)+(alpha^4+4*t^2*mu^2)*(delta^2+mu^2)))/(4*t*mu);
vzgrid=50;
vzset=linspace(0,vzm,vzgrid);
vzstep=vzset(2)-vzset(1);
% vzset2=0:vzstep/100:vzm;
en=zeros(1,length(vzset));
parfor i=1:length(vzset)
     warning('off','all');
    vz=vzset(i);
    ham=hc(1,mu,delta,vz,alpha,3000);    
    try 
       eigo=eigs(ham,10,'SM');     
        if (prod(isnan(eigo))==1)
            error("1 is not enough");
        end
   catch            
       try 
           eigo=eigs(ham,20,'SM');
            if (prod(isnan(eigo))==1)
                 error("20 is not enough");
            end
       catch
           eigo=eigs(ham,40,'SM');
            if (prod(isnan(eigo))==1)
                error("40 is not enough");
            end
       end
    end  
    en(i)=min(abs(eigo));
end
en2=(diff(en)-circshift(diff(en),1))/vzstep^2;
edge=en2(end);
[pk,~,w,~]=findpeaks(en2(2:end));
[~,ind]=max(w);
if(isempty(ind)==0) 
    re=max(pk(ind),edge);
else
    re=edge;
end

% fprintf("alpha=%f val=%s",alpha,re);
% pp=interp1(vzset,en,'spline','pp');
% pp_der=fnder(pp,2);
% slopes=ppval(pp_der,vzset2);
% re=max(slopes);
end
