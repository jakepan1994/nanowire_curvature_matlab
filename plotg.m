% mulist=0:.001:.4;
mu=.2;
alphalist=0:0.01:5;
vzlist=0:.005:.7;
en=zeros(length(alphalist),length(vzlist)-1);
parfor alphaindex=1:length(alphalist)
    alpha=alphalist(alphaindex);
    [~,en2]=g(mu,.2,alpha);
    en(alphaindex,:)=en2;
end
save('en2.dat','en','-ascii')