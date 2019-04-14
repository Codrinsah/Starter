#use v5.24;
use warnings;
my @usb,@ps2,@merged,$nrcump=0,$costtot=0;

my $line=<stdin>;
chomp($line);
my ($usbonly,$ps2only,$both)=split(/ /,$line);
$line=<stdin>;
chomp($line);
my ($n)=split(/ /,$line);
for (my $i=1;$i<=$n;$i++){
	$line=<stdin>;
	chomp($line);
	my ($cost,$tip)=split(/ /,$line);
	if ($tip eq "USB") {push @usb, $cost;}
	else {push @ps2, $cost;}
}
@usb=sort {$a<=>$b} @usb;
@ps2=sort {$a<=>$b} @ps2;
while ($usbonly>0 && scalar @usb>0){
	$usbonly--;
	$nrcump++;
	$costtot=$costtot+shift @usb;
}
while ($ps2only>0 && scalar @ps2>0){
	$ps2only--;
	$nrcump++;
	$costtot=$costtot+shift @ps2;
}
foreach my $var (@usb) {push @merged, $var;}
foreach my $var (@ps2) {push @merged, $var;}
@merged=sort {$a<=>$b} @merged;
while ($both>0 && scalar @merged>0){
	$both--;
	$nrcump++;
	$costtot=$costtot+shift @merged;
}
print $nrcump.' '.$costtot;
<stdin>;
exit(0);