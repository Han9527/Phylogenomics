#python scripts for phogenomics

PYTHON_SCRIPTS=/home/sda1/workspace/MetalRNA/18.comparative_genome/01.aa/12.new_del_Rs/00.species_tree/02.genefamily/python_scriptsi

#alistat count the blast nr
/home/zeng/miniconda3/pkgs/hmmer-3.2.1-he1b5a44_2/bin/esl-alistat test.fas

#phylogenomics tree
python2 ../python_scripts/cafetutorial_prep_r8s.py -i figtree.txt -o r8s_ctl_file.txt -s 23740 -p 'Hvulgare,Gmax' -c '152' &&
r8s -b -f r8s_ctl_file.txt > r8s_tmp.txt &&
tail -n 1 r8s_tmp.txt | cut -c 16- > ten_spp_r8s_ultrametric.txt

#laba.sh
echo '((((Hvulgare:40.045846,Osativa:40.045846):9.515352,Zmays:49.561198):102.438802,(((Boleracea:8.018639,Bjuncea:8.018639):15.013635,Ahalleri:23.032275):83.126951,((Pvulgaris:23.770861,Gmax:23.770861):20.918895,Psativum:44.689755):61.469470):45.840775)aremax:78.776900,Ppatens:230.776900);' | perl -p -e 's/\):\d+\.\d+/)1/g and s/\w+:\d+.\d+/1/g'
#cafe process
#!cafe
load -i filtered_cafe_input.txt -t 20 -l log_run1.txt -p 0.05
tree ((((Hvulgare:40.045846,Osativa:40.045846):9.515352,Zmays:49.561198):102.438802,(((Boleracea:8.018639,Bjuncea:8.018639):15.013635,Ahalleri:23.032275):83.126951,((Pvulgaris:23.770861,Gmax:23.770861):20.918895,Psativum:44.689755):61.469470):45.840775):78.776900,Ppatens:230.776900)
lambda -s -t ((((1,1)1,1)1,(((1,1)1,1)1,((1,1)1,1)1)1)1,1)
report resultfile1
#估计两个物种的时间选择上可能要注意下

#draw tree
python2 ../python_scripts/cafetutorial_draw_tree.py -i summary_run1_node.txt -t '((((Hvulgare:40.045846,Osativa:40.045846):9.515352,Zmays:49.561198):102.438802,(((Boleracea:8.018639,Bjuncea:8.018639):15.013635,Ahalleri:23.032275):83.126951,((Pvulgaris:23.770861,Gmax:23.770861):20.918895,Psativum:44.689755):61.469470):45.840775):78.776900,Ppatens:230.776900)' -d '((((Hvulgare<0>,Osativa<2>)<1>,Zmays<4>)<3>,(((Boleracea<6>,Bjuncea<8>)<7>,Ahalleri<10>)<9>,((Pvulgaris<12>,Gmax<14>)<13>,Psativum<16>)<15>)<11>)<5>,Ppatens<18>)<17>' -o metal_tree_rapid.tiff -y Rapid
python2 ../python_scripts/cafetutorial_draw_tree.py -i summary_run1_node.txt -t '((((Hvulgare:40.045846,Osativa:40.045846):9.515352,Zmays:49.561198):102.438802,(((Boleracea:8.018639,Bjuncea:8.018639):15.013635,Ahalleri:23.032275):83.126951,((Pvulgaris:23.770861,Gmax:23.770861):20.918895,Psativum:44.689755):61.469470):45.840775):78.776900,Ppatens:230.776900)' -d '((((Hvulgare<0>,Osativa<2>)<1>,Zmays<4>)<3>,(((Boleracea<6>,Bjuncea<8>)<7>,Ahalleri<10>)<9>,((Pvulgaris<12>,Gmax<14>)<13>,Psativum<16>)<15>)<11>)<5>,Ppatens<18>)<17>' -o metal_tree_exp.tiff -y Expansions
python2 ../python_scripts/cafetutorial_draw_tree.py -i summary_run1_node.txt -t '((((Hvulgare:40.045846,Osativa:40.045846):9.515352,Zmays:49.561198):102.438802,(((Boleracea:8.018639,Bjuncea:8.018639):15.013635,Ahalleri:23.032275):83.126951,((Pvulgaris:23.770861,Gmax:23.770861):20.918895,Psativum:44.689755):61.469470):45.840775):78.776900,Ppatens:230.776900)' -d '((((Hvulgare<0>,Osativa<2>)<1>,Zmays<4>)<3>,(((Boleracea<6>,Bjuncea<8>)<7>,Ahalleri<10>)<9>,((Pvulgaris<12>,Gmax<14>)<13>,Psativum<16>)<15>)<11>)<5>,Ppatens<18>)<17>' -o metal_tree_contractions.tiff -y Contractions
