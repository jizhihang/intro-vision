close all;

run_pyramid('ex2/tiger1.bmp','out/ex2-tiger.jpg');
run_pyramid('ex2/orange.jpg','out/ex2-orange.jpg');

run_image_focusing('ex2/tiger1.bmp','ex2/tiger2.bmp','out/ex3-tiger.jpg',4);
run_image_focusing('ex2/pumpkin1.png','ex2/pumpkin2.png','out/ex3-pumpkin.jpg',4);
run_image_focusing('ex2/tree1.png','ex2/tree2.png','out/ex3-tree.jpg',4);

run_image_mosaic('ex2/orange.jpg', 'ex2/apple.jpg', 'ex2/orangapple_m.bmp', 'out/ex4-orangeapple.jpg');
run_image_mosaic('ex2/obama.jpg','ex2/monalisa.jpg','ex2/monobama_m.jpg','out/ex4-monobama.jpg');
run_image_mosaic('ex2/monalisa.jpg','ex2/obama.jpg','ex2/monobama_m.jpg','out/ex4-obamona.jpg');
run_image_mosaic('ex2/tal.bmp','ex2/michal.bmp','ex2/michtal_m.bmp','out/ex4-michtal.jpg');
run_image_mosaic('ex2/michal.bmp','ex2/tal.bmp','ex2/michtal_m.bmp','out/ex4-talmich.jpg');