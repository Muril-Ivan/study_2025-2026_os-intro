#!/bin/bash
HELLO=Hello
function hello {
    HELLO=World
    echo $HELLO
}
echo $HELLO
hello
echo $HELLO 
