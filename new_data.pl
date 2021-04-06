@olist=();
open(IN,"SCOPe.txt");
	while($line=<IN>){
		chomp($line);
		@wds = split(/\s+/,$line);
		$len = @wds;
		if($len==2){
			push(@olist,$wds[0]);		
		}
	}
close IN;

@nlist=();
open(IN,"2domainlist.txt");
	while($line=<IN>){
		chomp($line);
		@wds = split(/\s+/,$line);
		$len = @wds;
		push(@nlist,$wds[0]);		
	}
close IN;

open(IN,"3domainlist.txt");
	while($line=<IN>){
		chomp($line);
		@wds = split(/\s+/,$line);
		$len = @wds;
		push(@nlist,$wds[0]);		
	}
close IN;

$len=@nlist;
print "this $len\n";

@add=();
for($i=0;$i<@nlist;$i++){
	$flag=1;
	for($j=0;$j<@olist;$j++){
		if($nlist[$i] eq $olist[$j]){
			$flag=0;
		}
	}
	if($flag==1){
		push(@add,$nlist[$i]);
	}
}

$len=@add;
print "add=$len\n";
for($i=0;$i<@add;$i++){
	print "$add[$i]\n";
}



