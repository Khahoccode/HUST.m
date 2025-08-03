function V = poisson(n,m,h,rotd,delta,V0,mask)
Niter = 100; %So lan lap toi da

% Ghi lai tri so the ban dau V0 vao ma tran V va ma tran Vold
 V =  V0;
 Vold = V0;
% Tinh  tri so the cac nut bang phuong phap lap
for k = 1: Niter
       
   for i = 2:n-1
    for j = 2:m-1
        if mask(i,j) == 1  %Chi tinh cac o co mask = 1
            V(i,j) = (1/4)*( V(i+1,j)+V(i-1,j)+V(i,j+1)+V(i,j-1)) + rotd*h*h/4;
        end
    end
   end
     
 % Tinh tri so tuyet doi cua cac hieu so cac the giua hai lan tinh lap
 DeltaV = zeros(n, m);
  for i = 2:n-1
     for j = 2: m-1
        if mask(i,j) == 1
           DeltaV(i,j) = abs(V(i,j) - Vold(i,j)); %V(Gia tri moi), Vold(Gia tri cu, luu lai gia tri cua V sau moi lan lap)
        end
     end    
  end
     deltamax = max(max(DeltaV));

 % Thay tri so the vua tinh duoc o chu trinh thu k vao ma tran Vold
     Vold = V;

 % kiem tra xem do chinh xac da dat duoc chua    
    if deltamax <= delta
         break
    end
end                                    


 










