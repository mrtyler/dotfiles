#!/bin/sh

src_dir=`pwd`
copy_us="Xclients"
symlink_us="Xdefaults"

# copy these 
for i in $copy_us
do
	# clean up name
	newname=`echo $i | sed -e 's/.template$//g'`
	cp $i $HOME/.$newname
done

# symlink these
for i in $symlink_us
do
	cd $HOME
	ln -s $src_dir/$i .$i
done

# some extra symlinks
cd $HOME
ln -s .Xclients .Xsession
ln -s .Xdefaults .Xresources
