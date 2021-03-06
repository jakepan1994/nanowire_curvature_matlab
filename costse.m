function re=costse(mu,gamma,alpha,expdata)
delta=.34;
vzm=1.1*sqrt(mu^2+gamma^2);
vzstep=0.005;
vzset=0:vzstep:vzm;
en=zeros(length(vzset),1);
parfor i=1:length(vzset)
    vz=vzset(i);
    tmp=iter(1,mu,delta,vz,alpha,gamma,75);    
    en(i)=tmp;
%     disp(i);
end
% figure;
% plot(vzset,en);


p=[en,vzset'];
p2=isnan(p);
p3=[p2(:,1),p2(:,1)];
p(p3)=[];
p=reshape(p,[],2);
en=p(:,1);
vzset=p(:,2);

hrzcor=interp1(en,vzset,-expdata(:,2),'spline','extrap');
hrzcor(isnan(hrzcor))=0;
re=sum(abs(hrzcor/hrzcor(end)-expdata(:,1)/expdata(end,1)));

fprintf("mu=%f,gamma=%f,alpha=%f,cost=%f\n",mu,gamma,alpha,re);

end