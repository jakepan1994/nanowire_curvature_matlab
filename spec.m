% tic
% vzset=linspace(0,.4,100);
% en=zeros(length(vzset),1);
% parfor i=1:length(vzset)
% %     en(i)=cost(.2,.2,5,vzset(i));
%    en(i)= eigs(hc(1,.2,.2,vzset(i),5,300),1,'sm');
% end
% toc

vzlist=linspace(0.,0.4,100);
% elist=linspace(0,.2,50);
rs=zeros(length(vzlist),1);

% pre=.2;

parfor i=1:length(vzlist)
    vz=vzlist(i);
% ham=hse(1,.2,.2,vz,5,,300);
% en=eig(ham);
% syms x;
% w=@(x) 1/condest(hse(1,.2,.2,vz,5,1,x,300));
% w=@(x) svds(hse(1,.2,.2,vz,2.5,.25,x,300),1,'sm','MaxIterations',10000);
rs(i)=iter(1, .2, .2, vz, 2.5, .2, 300);
end
% pre=fminbnd(w,0,pre,optimset('MaxIter',100000,'TolX',1e-8));
% pre=fminsearch(w,0,optimset('MaxIter',100000,'TolX',1e-8));

% parfor j=1:length(elist)
%     rs(i,j)=w(elist(j));
% end

% rs(i)=pre;
% end

% fzero(w,0)
% syms x
% dd=sym2poly(det(hc(1,.2,.2,.1,5,20)-x*eye(80)));
% roots(dd)
% func=@(x)  1/cond((A-x*eye(8)));
% funclist=@(xx) arrayfun(func,xx);
% 
%  fminbnd(func,-10,-1)