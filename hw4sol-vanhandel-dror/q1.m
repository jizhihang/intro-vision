clear all
clc

src = VideoReader('baby.mp4');
video = read(src, [1,10]); 

% video_pyramid = construct_video_pyramid(video);


% Save the dimensions of the video
pixels = size(video,1) * size(video,2);
frames = size(video,4);
colors = size(video,3);
spatial_time_m = reshape(video, pixels*colors, frames);
a = temporal_filter(spatial_time_m, [1 7*ones(1,9)]);%[ 1 7*ones(1,10)  ones(1,frames - 11) ]);
figure; hold; subplot(211); 
stem(a(313075,:));
subplot(212); stem(a(1,:));

writer = VideoWriter('mbaby.avi'); %, 'MPEG-4');
writer.FrameRate = src.FrameRate;
open(writer);

%output_frames = uint8(reshape(a,size(video,1),size(video,2),colors,frames));
frame_size = size(video,1)*size(video,2)*colors;
for i=1:frames
    output_frame = full(a(frame_size*(i-1)+1:frame_size*i));
    output_frame = uint8(reshape(output_frame,size(video,1),size(video,2),colors));
    writeVideo(writer, im2frame(output_frame));%output_frames(:,:,:,i)));
end;
close(writer);
