
table(as.numeric(substr(colnames(mrna_expr_tpm),14,15))<10)

a1 <- mrna_expr_tpm[,!as.numeric(substr(colnames(mrna_expr_tpm),14,15))<10][,2:11]
a2 <- mrna_expr_tpm[,as.numeric(substr(colnames(mrna_expr_tpm),14,15))<10][,1:10]

b1 <- clin_info[!as.numeric(substr(colnames(mrna_expr_tpm),14,15))<10,][2:11,]
b2 <- clin_info[as.numeric(substr(colnames(mrna_expr_tpm),14,15))<10,][1:10,]

brca_expr <- cbind.data.frame(a1,a2)[1:100,]

colnames(brca_expr) <- substr(colnames(brca_expr),1,12)

brca_expr <- cbind.data.frame(gene_symbol=rownames(brca_expr),brca_expr)
rownames(brca_expr) <- NULL


brca_clin <- rbind.data.frame(b1,b2)[,c(1:3,10,14,21,26,46,49)]

save(brca_expr,brca_clin, file = "brca_example.rdata")
saveRDS(brca_expr, file = "brca_example.rds")

write.csv(brca_expr,file = "brca_expr.csv",quote = F,row.names = F)
write.table(brca_expr, file = "brca_expr.txt",sep = "\t",row.names = F)


write.csv(brca_clin,file = "brca_clin.csv",quote = F,row.names = F)
write.table(brca_clin, file = "brca_clin.txt",sep = "\t",row.names = F)







