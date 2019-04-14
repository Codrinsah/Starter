#use v5.24;
use warnings;
 
my $line=<stdin>;
chomp($line);
my @array=split(/ /,$line);
my $n=$array[0];
my $k=$array[1];
my @divs;
my $cnt=0;

for (my $i=1; $i*$i<=$n; $i++){
	my $remainder=$n-$i* int ($n/$i);
	if ($remainder==0){
		$cnt++;
		push @divs, $i;
		if ($n/$i!=$i){
			$cnt++;
			push @divs, $n/$i;
		}
	}
}
@divs=sort {$a<=>$b}@divs;
if ($cnt<$k) {print -1;}
else {print $divs[$k-1];}
exit(0);