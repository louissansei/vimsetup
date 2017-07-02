vim_dir=${HOME}/.vim
autoload_dir=${vim_dir}/autoload
bundle_dir=${vim_dir}/bundle/
pathogen_file=${autoload_dir}/pathogen.vim

function clone() {
  git clone ${github_url}/$1 
  if [ $? -ne 0 ]
  then
     echo "failed to clone $1"
 fi 
}

mkdir -p ${autoload_dir} ${bundle_dir} 
cd ${bundle_dir}
if ! [ -f $pathogen_file ]; then 
    echo "Fetching pathogen..."
    curl -LSso ${pathogen_file} https://tpo.pe/pathogen.vim
fi

github_url=https://github.com

repos=(
    davidhalter/jedi-vim.git
    scrooloose/nerdcommenter.git
    scrooloose/nerdtree
    ervandew/supertab.git
    tpope/vim-fugitive.git
)    

for repo in ${repos[*]}
do
	clone ${repo}
done

#special for jedi
cd jedi-vim
git submodule update --init --recursive
