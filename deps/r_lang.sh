if [ -z "$(which Rscript)" ]; then
  apt-get install r-base
fi
R -q -e 'if(!require(jsonlite)) install.packages("jsonlite", repos="http://cran.us.r-project.org")'
R -q -e 'if(!require(clValid)) install.packages("clValid", repos="http://cran.us.r-project.org")'
R -q -e 'if(!require(amap)) install.packages("amap", repos="http://cran.us.r-project.org")'
R -q -e 'if(!require(sp)) install.packages("sp", repos="http://cran.us.r-project.org")'
R -q -e 'if(!require(ape)) install.packages("ape", repos="http://cran.us.r-project.org")'
R -q -e 'if(!require(flashClust)) install.packages("flashClust", repos="http://cran.us.r-project.org")'
R -q -e 'if(!require(fpc)) install.packages("fpc", dependencies=TRUE)'
R -q -e 'if(!require(cluster)) install.packages("cluster", repos="http://cran.us.r-project.org")'
