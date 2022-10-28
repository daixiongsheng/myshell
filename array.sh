#!/bin/bash
if [ -f "$PWD/class.sh" ]
then
  source "$PWD/class.sh"
fi


# class definition
class Array
func Array
func push
func pop
func at
func print
func getLength

# class implementation
Array::Array() {
	if [ $# -gt 0 ]
	then 
		push $@
	fi
}

Array::push() { 
  for i in "$@"
  do
    data[${#data[*]}]=$i
  done
}

Array::pop() { 
	lastIndex=$((${#data[@]}-1))
	ret=${data[lastIndex]}
	unset data[$lastIndex]
	echo $ret
}

Array::at() { 
	index=$1
	ret=${data[index]}
	echo $ret
}

Array::print() {
	for i in ${data[*]}
	do
		echo $i
	done
}

Array::getLength() {
	echo ${#data[*]}
}


#usage
new Array one 1 2 3 4
new Array two

one.push 5 6 
two.push 5 6 

one.print
echo "长度" `one.getLength`

# two.print


echo ""
echo "one: $one ($(typeof $one))"
echo "two: $two ($(typeof $two))"







# #---------------------------------------------------
# # Example code
# #---------------------------------------------------

# class definition
class Storpel
func Storpel
func setName
func setQuality
func print
var name
var quality

# class implementation
Storpel::Storpel() {
    setName "$1"
    setQuality "$2"
}

Storpel::setName() { name="$1"; }
Storpel::setQuality() { quality="$1"; }
Storpel::print() { echo "$name ($quality)"; }


echo $name name
#usage
new Storpel one "Storpilator 1000" Medium
new Storpel two
new Storpel three
#
two.setName "Storpilator 200xxx0"
two.setQuality "Strong"

one.print
two.print
three.print

echo ""
echo "one: $one ($(typeof $one))"
echo "two: $two ($(typeof $two))"
echo "Three: $three ($(typeof $three))"