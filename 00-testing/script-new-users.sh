# sintaxis:
#newusers-in-bulk user_prefix user_number password mygroupname

# example:
#biomed26 10 biomed26123 bioinformatics
#./script-new-users.sh biomed26 10 biomed26123 bioinformatics

user_prefix=$1
user_number=$2
user_pwd=$3
user_group=$4

myfilename="/tmp/"$(date +%Y-%m-%d-%H%M%S)"-users.txt"
touch $myfilename
chmod 600 $myfilename


echo "total: "$user_number
echo "users path: " $myfilename
# /tmp/user_list$.txt
# chmod 600 /tmp/user_list.txt

for ((i=1; i<=$user_number; i++)); do
   this_user_prefix=$user_prefix$(printf "%02d" "$i")
   #this_user_prefix=$user_prefix$this_user_prefix
   echo $this_user_prefix
   echo $this_user_prefix":"$user_pwd"::"$user_group":"$this_user_prefix:"/home/"$this_user_prefix":"/bin/bash >> $myfilename
done

# for i in {1..${user_number}}
# do
#    this_user_prefix=$(printf "%02d" "$i")
#    echo $user_prefix$this_user_prefix
#    this_user_prefix=$user_prefix$this_user_prefix
#    echo $this_user_prefix
# done

sudo newusers $myfilename

# Missing Skeleton Files
# and the users are assigned to the wrong shell (/bin/sh)
# Solution:
# copy the default configuration files from the /etc/skel directory
# and assign the shell /bin/bash to users
for ((i=1; i<=$user_number; i++)); do
   this_user_prefix=$user_prefix$(printf "%02d" "$i")
    sudo cp /etc/skel/.bashrc /etc/skel/.profile /home/$this_user_prefix/
    sudo chown $this_user_prefix:$user_group /home/$this_user_prefix/.bashrc /home/$this_user_prefix/.profile
    sudo usermod -s /bin/bash $this_user_prefix
done


# OPTION B
# Linux systems include a built-in helper utility designed exactly for this scenario. Run this immediately after your newusers command:
# sudo mkhomedir_helper username



# for user in biomed2601 biomed2602 biomed2603 biomed2604 biomed2605 biomed2606 biomed2607 biomed2608 biomed2609 biomed2610 biomed2611; do                    
#     sudo cp /etc/skel/.bashrc /etc/skel/.profile /home/$user/
#     sudo chown $user:$user /home/$user/.bashrc /home/$user/.profile
# done


# for user in biomed2601 biomed2602 biomed2603 biomed2604 biomed2605 biomed2606 biomed2607 biomed2608 biomed2609 biomed2610 biomed2611 biomed2612; do
#    sudo usermod -s /bin/bash $user
# done
