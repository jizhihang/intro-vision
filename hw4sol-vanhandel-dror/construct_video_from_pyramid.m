function [video_out] = construct_video_from_pyramid(pyramid,pyramid_frame_sizes)
    % takes a cell arrray of size 5, where each cell is a video stream
    % of the respective level of the Laplacian pyramid, reconstructs
    % the image at every frame, and writes the reconstructed video to file.
    % pyramid_frame_sizes is a cell array that defines the size of a frame 
    % (x,y,colors) for each level in the pyramid.
    a = 0.6;
    d = 4;

%     writer = VideoWriter(filename_out);
%     writer.FrameRate = FrameRate;
%     open(writer);
    
    % preallocate memory
    L = cell(1,d+1); % Preallocate the pyramid
    video_out = zeros( [pyramid_frame_sizes{1},size(pyramid{1},2)] , 'uint8');
    for frame_idx=1:size(pyramid{1},2) % for every frame in the video
        for level=1:d+1
            % L{level} = pyramid{level}(:,:,:,frame_idx);
            frame_size = prod(pyramid_frame_sizes{level});
            output_frame = full(pyramid{level}(frame_size*(frame_idx-1)+1:frame_size*frame_idx));
            L{level} = reshape(output_frame, ...
                   pyramid_frame_sizes{level}(1), ...
                   pyramid_frame_sizes{level}(2), ...
                   pyramid_frame_sizes{level}(3));
        end;

        I_after = im2uint8(abs(L_pyramid_decode(L,a)));
        video_out(:,:,:,frame_idx) = I_after;
        %writeVideo(writer, im2frame(im2uint8(uint8(subplus(255*I_after)))));
    end;
    %close(writer);    
    
end