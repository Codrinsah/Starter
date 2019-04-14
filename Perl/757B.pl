#use v5.24;
use warnings;
my $n=<stdin>;
chomp($n);
my $line=<stdin>;
chomp($line);
my @array=split(/ /,$line);
my %fr,@prim;
for (my $i=2;$i<=100000;$i++) {$fr{$i}=0;}
for (my $i=2;$i<=100000;$i++){
	if ($fr{$i}==0){
		for (my $j=$i+$i;$j<=100000;$j=$j+$i) {$fr{$j}=1;}
		push @prim, $i;
	}
}
for (my $i=2;$i<=100000;$i++) {$fr{$i}=0;}
foreach my $el (@array){
	my $i=2;
	while ($i*$i<=$el){
		if ($el==$i* int ($el/$i)){
			$fr{$i}++;
			while ($el==$i* int ($el/$i)){
				$el=$el/$i;
			}
		}
		$i++;
	}
	$fr{$el}++;
}
my $max=0;
foreach my $nr (@prim){
	if ($max<$fr{$nr}) {$max=$fr{$nr};}
}
print $max;
exit(0);