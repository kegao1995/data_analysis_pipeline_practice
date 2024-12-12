# Default target: Generate everything including the report
.PHONY: all clean

all: results/figure/isles.png \
    results/figure/abyss.png \
    results/figure/last.png \
    results/figure/sierra.png \
	report/count_report.html

# Rule to count words
results/isles.dat: data/isles.txt
	python scripts/wordcount.py \
	    --input_file=data/isles.txt \
	    --output_file=results/isles.dat

results/abyss.dat: data/abyss.txt
	python scripts/wordcount.py \
	    --input_file=data/abyss.txt \
	    --output_file=results/abyss.dat

results/last.dat: data/last.txt
	python scripts/wordcount.py \
	    --input_file=data/last.txt \
	    --output_file=results/last.dat

results/sierra.dat: data/sierra.txt
	python scripts/wordcount.py \
	    --input_file=data/sierra.txt \
	    --output_file=results/sierra.dat

# Rule to create plots
results/figure/isles.png: results/isles.dat
	python scripts/plotcount.py \
	    --input_file=results/isles.dat \
	    --output_file=results/figure/isles.png

results/figure/abyss.png: results/abyss.dat
	python scripts/plotcount.py \
	    --input_file=results/abyss.dat \
	    --output_file=results/figure/abyss.png

results/figure/last.png: results/last.dat
	python scripts/plotcount.py \
	    --input_file=results/last.dat \
	    --output_file=results/figure/last.png

results/figure/sierra.png: results/sierra.dat
	python scripts/plotcount.py \
	    --input_file=results/sierra.dat \
	    --output_file=results/figure/sierra.png

report/count_report.html: report/count_report.qmd
	quarto render report/count_report.qmd

# Clean up generated files
clean:
	rm -f \
	    results/isles.dat \
	    results/abyss.dat \
	    results/last.dat \
	    results/sierra.dat \
	    results/figure/isles.png \
	    results/figure/abyss.png \
	    results/figure/last.png \
	    results/figure/sierra.png \
        report/count_report.html
