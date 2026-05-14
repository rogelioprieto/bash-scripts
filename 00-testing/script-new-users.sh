# sintaxis:
#newusers user_prefix user_number password mygroupID

# example:
#biomed26 10 biomed26123 1012
user_prefix=$1
user_number=$2
user_pwd=$3
user_group=$4

echo "total: "$user_number

for ((i=1; i<=$user_number; i++)); do
   this_user_prefix=$user_prefix$(printf "%02d" "$i")
   #this_user_prefix=$user_prefix$this_user_prefix
   echo $this_user_prefix
   echo $this_user_prefix":"$user_pwd"::"$user_group":"$this_user_prefix:"/home/"$this_user_prefix":"/bin/bash
   #  /temp/user_list.txt

done

# for i in {1..${user_number}}
# do
#    this_user_prefix=$(printf "%02d" "$i")
#    echo $user_prefix$this_user_prefix
#    this_user_prefix=$user_prefix$this_user_prefix
#    echo $this_user_prefix
# done

