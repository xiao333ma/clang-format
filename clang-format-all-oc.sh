format() {
    for path in $1
    do
        clang-format -i -style=file "$path"
    done
}




cp .clang-format-oc $1/.clang-format

cd $1

h_name_list=$(find . -name "*.h" | xargs)
m_name_list=$(find . -name "*.m" | xargs)
mm_name_list=$(find . -name "*.mm" | xargs)


format "${h_name_list[*]}"
format "${m_name_list[*]}"
format "${mm_name_list[*]}"

rm .clang-format