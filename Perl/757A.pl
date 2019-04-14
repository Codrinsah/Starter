#use v5.24;
use warnings;
my %fr;

my $line=<stdin>;
chomp($line);
my @word=split(//,$line);
for (my $i=ord("A");$i<=ord("z");$i++){
	$fr{chr($i)}=0;
}
foreach my $lit (@word){
	$fr{$lit}++;
}
$fr{"u"}=int $fr{"u"}/2;
$fr{"a"}=int $fr{"a"}/2;
my @key=("B","u","l","b","a","s","a","u","r");
my $min=100006;
foreach my $lit (@key){
	if ($min>$fr{$lit}) {$min=$fr{$lit}};
}
print $min;
<stdin>;
exit(0);

#Bulbasaur