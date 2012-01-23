#!/bin/sh

src_dir=`pwd`
copy_us="bashrc.template profile.template"
symlink_us="vimrc cvsrc mailcap screenrc"

# stupid default .bash_profile screws up my shit
mv ~/.bash_profile ~/.bash_profile.orig.diediedie

# copy these 
for i in $copy_us
do
	# clean up name
	newname=`echo $i | sed -e 's/.template$//g'`
	cp -i $i $HOME/.$newname
done

# symlink these
for i in $symlink_us
do
	cd $HOME
	ln -s $src_dir/$i .$i
done
