close all;
clear all;

m= [1 7*ones(1,20) ones(1,19)];%[1 7*ones(1,20) ones(1,279) ];
magnify('baby.mp4','pbaby.avi', m,m,m,m,m);

% src = VideoReader('baby.mp4');
% video = read(src,[1,10]); 
% 
% video_pyramid = construct_video_pyramid(video);
% 
% 
% % Save the dimensions of the video
% pixels = size(video,1) * size(video,2);
% frames = size(video,4);
% colors = size(video,3);
% spatial_time_m = reshape(video, pixels*colors, frames);
% a = temporal_filter(spatial_time_m, [ 1 7*ones(1,20)  ones(1,frames - 21) ]);
% figure; hold; subplot(211); 
% stem(a(313075,:));
% subplot(212); stem(a(1,:));
% 
% writer = VideoWriter('mbaby.avi'); %, 'MPEG-4');
% writer.FrameRate = src.FrameRate;
% open(writer);
% 
% output_frames = uint8(reshape(a,size(video,1),size(video,2),colors,frames));
% for i=1:frames
%     writeVideo(writer, im2frame(output_frames(:,:,:,i)));
% end;
% close(writer);
