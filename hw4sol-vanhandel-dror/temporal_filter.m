function [ filtered_matrix ] = temporal_filter (spatial_time_matrix, frequency_mask)
%     Transpose the s.t.m to get the fft of every time vector
%     since fft of a matrix returns the fft of every column of the matrix
    if isequal(frequency_mask, ones(size(frequency_mask)))
        filtered_matrix = spatial_time_matrix;
        return;
    end;
    pixels = size(spatial_time_matrix,1);
    NUM_PARALLEL_COLS = floor(pixels/ ceil(pixels/1e4));
    size_stm = size(spatial_time_matrix);
    %filtered_matrix = sparse(size_stm(1),size_stm(2));%,'double');
    filtered_matrix = zeros([size_stm(1),size_stm(2)]);
    %mask = single(ones(NUM_PARALLEL_COLS,1) *frequency_mask);

    max_var = 0;
    max_var_fft = 0;
    for i = 1:floor(pixels/NUM_PARALLEL_COLS)
        a = (i-1) * NUM_PARALLEL_COLS + 1;
        b = i * NUM_PARALLEL_COLS;
        %fprintf('%g-%g of %d\n',a,b, pixels);
        spatial_freq_matrix = fft(spatial_time_matrix(a:b,:),[],2);
        
%         if(max(var(spatial_freq_matrix ,[],2)) > max_var)
%             max_var = max(var(spatial_freq_matrix ,[],2));
%             max_var_fft=(spatial_freq_matrix (var(spatial_freq_matrix ,[],2) == max_var,:));
%         end;
        
        %tmp = sparse(ifft(spatial_freq_matrix .* mask,[], 2));
        tmp = sparse((ifft(bsxfun(@times,spatial_freq_matrix, frequency_mask),[], 2)));
        tmp = (tmp .* (abs(tmp)>=1e-4));
        filtered_matrix(a:b,:) = tmp; 
        % (keep the matrix sparse by zeroing out everything thats less 1e-4)
    end
%     stem(max_var_fft);
end