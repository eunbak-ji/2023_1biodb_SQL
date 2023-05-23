USE ProjectDB;

/****데이터 가져오기****/
CREATE TABLE tbl_gtf_parsing (
chrom CHAR(5),
START_bp INT,
END_bp INT,
gene_id VARCHAR(30),
gene_type VARCHAR(50),
gene_symbol VARCHAR(50));

LOAD DATA LOCAL INFILE 'C:/Users/YoRHa/Desktop/MySQL_GTF_parsing_v43.txt' 
	INTO TABLE tbl_gtf_parsing FIELDS TERMINATED BY '\t';
	
	
/* (1) lncRNA 의 개수를 구하시오. */
SELECT COUNT(gene_type) FROM tbl_gtf_parsing WHERE gene_type='lncRNA';

/* (2) 유전자수가 가장 적은 염색체를 구하시오. */
SELECT chrom, COUNT(gene_id) AS cnt FROM tbl_gtf_parsing GROUP BY chrom ORDER BY cnt ASC LIMIT 1;

/* (3) gene_type의 종류의 개수를 구하시오. */
SELECT COUNT(DISTINCT(gene_type)) FROM tbl_gtf_parsing;

/* (4) 길이가 가장 긴 유전자의 심볼과 그 길이를 구하시오. */
SELECT *, (END_bp-START_bp) AS length_bp FROM tbl_gtf_parsing 
WHERE (END_bp-START_bp) = (SELECT MAX(END_bp-START_bp) FROM tbl_gtf_parsing);
