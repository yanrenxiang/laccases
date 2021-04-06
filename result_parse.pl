$str = "->";
for($i=1;$i<=5;$i++){
	@score = ();
	open(IN,"nn_$i.txt");
		while($line=<IN>){
			chomp($line);
			if($line=~/^$str/){
				@wds = split(/\s+/,$line);
				push(@score,$wds[1]);
			}		
		}
	close IN;

	@label=();
	open(IN,"nn_test0$i");
		while($line=<IN>){
			chomp($line);
			@wds = split(/\s+/,$line);
			$len = @wds;
			if($len==1){
				if($wds[0]>0.5){
					push(@label,1);
				}else{
					push(@label,0);
				}
			}
		}
	close IN;

	$len1 = @score;
	$len2 = @label;
	print "len1=$len1  len2=$len2\n";	
}

open(OUT,">nn_roc.dat");
for($i=0;$i<@score;$i++){
	print OUT "$label[$i] $score[$i]\n";
}
close OUT;

