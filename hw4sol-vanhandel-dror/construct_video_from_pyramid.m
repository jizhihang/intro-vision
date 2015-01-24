function construct_video_from_pyramid(pyramid,filename_out, FrameRate)
    % takes a cell arrray of size 5, where each cell is a video stream
    % of the respective level of the Laplacian pyramid, reconstructs
    % the image at every frame, and writes the reconstructed video to file.
    a = 0.6;
    d = 4;

    writer = VideoWriter(filename_out);
    writer.FrameRate = FrameRate;
    open(writer);
    
    % preallocate memory
    L = cell(1,d+1); % Preallocate the pyramid
    
    
    for frame_idx=1:size(pyramid{1},4) % for every frame in the video
        for level=1:d+1
            L{level} = pyramid{level}(:,:,:,frame_idx);
        end;

        I_after = L_pyramid_decode(L,a);
        writeVideo(writer, im2frame(im2uint8(subplus(I_after))));
    end;
    close(writer);    
end