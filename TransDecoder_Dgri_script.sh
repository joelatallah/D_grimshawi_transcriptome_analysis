#!/bin/bash

# Dgri
util/gtf_genome_to_cdna_fasta.pl Atallah_lab_data/Dgri/merged_gri.gtf Atallah_lab_data/Dgri/GCF_000005155.2_dgri_caf1_genomic.fna > Dgri_transcripts.fa
util/gtf_to_alignment_gff3.pl Atallah_lab_data/Dgri/merged_gri.gtf > Dgri_transcripts.gff3
./TransDecoder.LongOrfs -m 50 -S -t Dgri_transcripts.fa > Logs/Dgri_LongOrfs_log.txt
./TransDecoder.Predict -t Dgri_transcripts.fa > Logs/Dgri_Predict_log.txt
util/cdna_alignment_orf_to_genome_orf.pl Dgri_transcripts.fa.transdecoder.gff3 Dgri_transripts.gff3 Dgri_transcripts.fa > Dgri_transcripts.fa.transdecoder.genome.gff3