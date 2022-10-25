

ROOT=$(dirname $(readlink -f $(dirname $0)))

PROPOSAL=ROOT/"proposal"
THESIS=ROOT/"thesis"


function RUN_COMPILER() {
    cd $0
    latexmk -pdf -view=none -pvc -xelatex -f *.tex   
}


RUN_COMPILER $PROPOSAL &
RUN_COMPILER $THESIS &
