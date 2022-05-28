fs=$(find ./*.json -type f | wc -l)
mkdir ./1
for ((q=0; q < $fs; q++))
do
	f=$(find ./*.json -type f | head -1)
	for ((i=0; i < 10000; i++))
	do
	cat ./$f | jq '.['$i']' | sed 's/\,,//g' | sed 's/\""//g' | sed 's/\[//g' | sed 's/\]//g' | sed 's/\,//g'  | sed -n -e 2,3p -e 8p | sed 's/\  //g' | tr '\n' ' ' >> ./all.txt
	echo "" >> ./all.txt
	done
	mv $f ./1/
echo "Мы распарсили $i значений файла $f"
done
