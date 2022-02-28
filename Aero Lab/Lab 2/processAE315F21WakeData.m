function [deltapMean,deltapSmooth,deltapStd,...
    pAtms,TAtms,z,dpInf]=processAE315F21WakeData(dirName,fName,iZTop,iZBtm)

% deltapMean,deltapSmooth,deltapStd in inH20
% pAtm in Pa
% TAtm in K
% z in m

% deltapSmooth averages everthing that is not part of the wake
% iZBtm is the index for the bottom most point that forms the wake
% iZTop is the index for the top most point that forms the wake

% dpInf gives the dpInf of the free-stream. This is calculated by taking
% the mean dp of all the points that do not form part of the wake

nPts=9;

z=zeros(1,nPts);
deltapMean=z;
deltapStd=z;
pAtms=z;
TAtms=z;
for i=1:1:nPts
   data=load(fullfile(dirName,[fName '_' num2str(i) '.mat'])); 
   deltapMean(i)=mean(data.dp.*248.84);
   deltapStd(i)=std(data.dp.*248.84);
   pAtms(i)=data.pAtm.*3386.39;
   TAtms(i)=data.tAtm;
   z(i)=data.zCurr.*0.0254;
end

%smooths skipping everthing between iZTop and iZBtm
deltapSmooth=smooth(deltapMean,7,'sgolay');
deltapSmooth(iZBtm:iZTop)=deltapMean(iZBtm:iZTop);
temp=(deltapSmooth(1:iZBtm-1));
temp=[temp; deltapSmooth(iZTop+1:end)];
dpInf=mean(temp);
deltapSmooth(1:iZBtm-1)=dpInf;
deltapSmooth(iZTop+1:end)=dpInf;

return;