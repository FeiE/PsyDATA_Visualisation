function ClassificationImage(data,maxmi,background,colo,pos,colorb)

% data should be 3D (conditions, mi, mi)
% FEI YI - University of Glasgow - March 2 2016

if isempty(colo)
    colo = gray(size(data,1)+1);
end
if isempty(maxmi)
    maxmi = max(data(:));
end

%%
condis = size(data,1);
filepath = '/analyse/Project0140/bubcont2/';
eval(['load ',filepath,'face_aperture'])
face_aperture=logical(face_aperture);
[Y,X]=find(face_aperture==1);
sx=min(X);
ex=max(X);
sy=min(Y);
ey=max(Y);
face_aperture=face_aperture(sy:ey,sx:ex);
[x,y] = size(face_aperture); 

% frame
wt = 10;% width of border 
tmp = zeros(x+wt,y+wt); 
tmp(1:wt/2+1,1:y+wt) = 1;
tmp(1:x+wt,1:wt/2+1) = 1;
tmp(1:x+wt,y+wt/2:y+wt) = 1;
tmp(x+wt/2:x+wt,1:y+wt) = 1; % border

tmpback = zeros(size(background));
tmpback(:,wt/2+1:x+wt/2,wt/2+1:y+wt/2) = background;

tmpface = zeros(x+wt,y+wt);
tmpface(wt/2+1:x+wt/2,wt/2+1:y+wt/2) = face_aperture;
tmptoplot = zeros(x+wt,y+wt);

% Choose a colormap for the underlay
CM_under = gray(256);
% Choose a colormap for the overlay
CM_over = viridis(256);

alphamap = double(tmpface);
transp = .7;% transparency
alphamap(alphamap==1)=transp;

%%

if colorb
    posb = pos;
    posb(1) = posb(1) + posb(3)*.1;
    posb(3) = posb(3) *.05;    
    colormap(viridis);
    h=colorbar('position',posb,'FontSize',11,'ticklength',.02)
    caxis([0 max(data(:))]);
    axis tight;axis off;box on
end

for c = 1:condis
    if isempty(pos)
        subplot(3, size(data,1), size(data,1)+c);hold on
    elseif ~isempty(pos)
        if c~=1
            pos(1) = pos(1) + pos(3).*(.5+(1/size(data,1)));
        end
        axes('Position',pos);hold on
    end
    
    U_RGB = convert_to_RGB(squeeze(tmpback(c,:,:)), CM_under);% size(U_RGB)
    layer1 = image(U_RGB);axis image;    hold on
    
    toplot = squeeze(data(c,:,:));
    toplot(toplot<0)=0; toplot(isnan(toplot))=0;
    toplot = imresize(toplot, 2, 'bilinear', 'Antialiasing', false);
    tmptoplot(wt/2+1:x+wt/2,wt/2+1:y+wt/2) = toplot;
    layer2=image(convert_to_RGB(tmptoplot,CM_over,[0 maxmi]));
    axis image;axis off;set(layer2, 'alphaData', alphamap);
    
    cmask=cat(3, ones(size(tmp)), ones(size(tmp)), ones(size(tmp)));
    layer3=imagesc(cmask);set(layer3, 'AlphaData', double(~tmpface));axis image;axis off
    axis tight;axis square
    set(gcf,'PaperPositionMode','auto');
    
    cfmask=cat(3, ones(size(tmp)).*colo(c,1), ones(size(tmp)).*colo(c,2), ones(size(tmp)).*colo(c,3));
    layer4=imagesc(cfmask); axis image; axis off; set(layer4, 'AlphaData', double(tmp));    
    set(gca,'YDir','reverse')

end
        
set(gcf,'renderer','painter');
set(gca,'YDir','reverse')
