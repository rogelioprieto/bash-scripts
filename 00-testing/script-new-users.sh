# sintaxis:
#newusers-in-bulk user_prefix user_number password mygroupname

# example:
#biomed26 10 biomed26123 bioinformatics
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



