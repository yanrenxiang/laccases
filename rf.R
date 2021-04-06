library(randomForest)
group=c("01")
for(g in group){
	train<-read.csv(paste('./train',g,sep=''))
	long<-length(train)
	model<-randomForest(train[2:long],factor(train[[1]]),prox=TRUE)
	save(model,file=paste('./model',g,sep=''))
	test<-read.csv(paste("./test",g,sep=""))
	result<-predict(model,test[2:long],type="prob")
	write(paste(test$id,result[,1],test$class,sep="\t"),file=paste('./result',g,sep=''))
	write.table(result,file="./result_table.txt",append=F)
}
