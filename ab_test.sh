
echo "changing the project to use either $2 or $3 for mix_buffer_size, then launching $1."

R=$RANDOM

if [ `expr $R % 2` -eq 0 ]
then
  sed "s/mix_buffer_size.*/mix_buffer_size=$2/" project.godot > new_project.godot
else
  sed "s/mix_buffer_size.*/mix_buffer_size=$3/" project.godot > new_project.godot
fi

mv new_project.godot project.godot

if grep -q mix_buffer_size project.godot
then
  echo "everything looks good, found the setting in project.godot"
else
  echo "this is bad!!! the setting is missing from project.godot, do not trust the results of your test."
fi

$1 &> /dev/null
