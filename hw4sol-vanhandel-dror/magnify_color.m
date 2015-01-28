function [ video_out ] = magnify_color( video, m0, m1, m2, m3, m4 )
    % Initialize the masks
    d=4;
    M = cell(1,d+1); % Preallocate the cell array
    M{1} = m0; M{2} = m1; M{3} = m2; M{4} = m3; M{5} = m4;
    
    frame_sizes = cell(1,d+1);    
    frames = size(video,4);
    
    % Create the laplacian pyramids
    video_pyramid = construct_video_pyramid(video);
    
    for i=1:d+1
        % Save the rest of the dimensions of the video
        pixels = size(video_pyramid{i},1) * size(video_pyramid{i},2);
        dimensions = size(video_pyramid{i});
        frame_sizes{i} = dimensions(1:3);
        
        % Reshape the image to a time vector, 
        spatial_time_m = reshape(video_pyramid{i}, pixels, frames);

        % Enhance the chosen frequencies
        a = temporal_filter(spatial_time_m, M{i});
        %a = spatial_time_m;
        
        
        % replace in-place
        video_pyramid{i} = a;%reshape(a,size(video_pyramid{i},1), ...
                             %size(video_pyramid{i},2),colors,frames);
                             
%         video_pyramid{i} = uint8(255* reshape(a,size(video_pyramid{i},1), ...
%                              size(video_pyramid{i},2),colors,frames));
    end;

    % Plot the fft of an inside pixel (it's the one with the most variance)
    % figure; hold; subplot(211); 
    % stem(a(313075,:));
    % subplot(212); stem(a(1,:)); % and the top-left pixel just for comparison

    video_out = construct_video_from_pyramid(video_pyramid,frame_sizes);
end

