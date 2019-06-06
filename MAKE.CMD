rem This make script runs in OS/2 protected mode

masm -Mx cominit;
link cominit.obj,cominit.sys,,,cominit.def
