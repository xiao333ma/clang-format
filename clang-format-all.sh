
# format a dir
# sh clang-format-all.sh /path/you/want/to/format

function getdir(){
    for file in $1/*
    do
    if test -f $file 
    then
        extension="${file##*.}"
        if [ "$extension" = "h" ] || [ "$extension" = "m" ] || [ "$extension" = "mm" ]
        then 
            arr=(${arr[*]} $file)
        fi
    else
            getdir $file
    fi
    done
}

cp .clang-format $1
getdir $1

for path in "${arr[@]}"
do
    echo $path
    clang-format -i -style=file "$path"
done
