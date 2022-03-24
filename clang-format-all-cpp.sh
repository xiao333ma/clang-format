
format() {
    echo $1
    for path in $1
    do
        clang-format -i -style=file "$path"
    done
}



cp .clang-format-cpp $1/.clang-format

cd $1


h_name_list=$(find . -name "*.c" | xargs)
cpp_name_list=$(find . -name "*.cpp" | xargs)


format "${h_name_list[*]}"
format "${cpp_name_list[*]}"

rm .clang-format