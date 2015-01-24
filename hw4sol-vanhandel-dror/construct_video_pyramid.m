function [video_pyramid]=construct_video_pyramid(video)
    % takes a video, and creates 5 video streams in a cell array, each
    % element of the array is the video stream of the respective level.
    % video_pyramid{1} contains a full size video (only diffs), 
    % and video_pyramid{5} contains the smallest video size in the pyramid.
    
    a = 0.6;
    d = 4;
    
    % preallocate memory
    video_pyramid = cell(1,d+1); % Preallocate the pyramid
    
    % create a pyramid just to get the dimensions of each level
    I_before = im2double(video(:,:,:,1));
    L = L_Pyramid(I_before,a,d);
    for i=1:d+1 % allocate each video stream level
        video_pyramid{i} = zeros(size(L{i},1), size(L{i},2), ...
                                 size(video,3), size(video,4));
    end;
    
    % figure; hold;
    for frame_idx=1:size(video,4) % for every frame in the video
        I_before = im2double(video(:,:,:,frame_idx)); % get the frame
        L = L_Pyramid(I_before,a,d);
        for level=1:d+1
            video_pyramid{level}(:,:,:,frame_idx) = L{level};
        end;
        % for i=1:d+1; subplot(d+1,1,i); imshow(video_pyramid{i}(:,:,:,frame_idx)); end;
    end;
end