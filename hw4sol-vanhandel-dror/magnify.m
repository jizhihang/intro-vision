function magnify(filename_in, filename_out, m0, m1, m2, m3, m4)
    d = 4;
    src = VideoReader(filename_in);
    video = read(src, [ 1, size(m0,2)]);
    % Save the dimensions of the video
    frame_sizes = cell(1,d+1);    
    frames = size(video,4);
    colors = size(video,3);
    
    video_out = zeros(size(video) , 'uint8');
    for c=1:colors
        video_out(:,:, c, :)=magnify_color(video(:,:,c,:),m0,m1,m2,m3,m4);
    end
    writer = VideoWriter(filename_out);
    writer.FrameRate = src.FrameRate;
    open(writer);
    for i=1:frames
        writeVideo(writer, im2frame(video_out(:,:,:,i)));
    end;
    close(writer);
end