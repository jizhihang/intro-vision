% function [ filtered_matrix ] = temporal_filter (spatial_time_matrix, frequency_mask )
%     % Transpose the s.t.m to get the fft of every time vector
%     % since fft of a matrix returns the fft of every column of the matrix
%     
% %     spatial_freq_matrix = fft(spatial_time_matrix,[],2);
% %     repl_mask = repmat(frequency_mask, length(frequency_mask),1)
% %     filtered_matrix = ifft((spatial_freq_matrix .* repl_mask'),[],2);
%     
%     filtered_matrix = zeros(size(spatial_time_matrix),'uint8');
%     fprintf('Running until %d\n', size(spatial_time_matrix,1));
%     for i=1:size(spatial_time_matrix,1)
%         spatial_freq_matrix = fft(spatial_time_matrix(i,:));
%         filtered_matrix(i,:) = ifft(spatial_freq_matrix .* frequency_mask);
%         if (mod(i,100000) == 0) 
%             fprintf('%d\n ', i);
%         end;
%     end;
% end

function [ filtered_matrix ] = temporal_filter (spatial_time_matrix, frequency_mask)
    % Transpose the s.t.m to get the fft of every time vector
    % since fft of a matrix returns the fft of every column of the matrix

    pixels = size(spatial_time_matrix,1);
    NUM_PARALLEL_COLS = floor(pixels/ ceil(pixels/5e4));
    filtered_matrix = zeros(size(spatial_time_matrix),'double');%'uint8');
    mask = ones(NUM_PARALLEL_COLS,1) *frequency_mask;


    for i = 1:floor(pixels/NUM_PARALLEL_COLS)
        a = (i-1) * NUM_PARALLEL_COLS + 1;
        b = i * NUM_PARALLEL_COLS;
        fprintf('%g-%g of %d\n',a,b, pixels);
        spatial_freq_matrix = fft(spatial_time_matrix(a:b,:),[],2);
        filtered_matrix(a:b,:) = abs(ifft(spatial_freq_matrix .* mask,[], 2));
    end

end