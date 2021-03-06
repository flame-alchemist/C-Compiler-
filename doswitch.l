%{
#include "y.tab.h"
#include<stdio.h>
%}

alpha [A-Za-z]
digit [0-9]
%option yylineno
%%
[ \t\n] 
\/\/.* 
\/\*(.*\n)*.*\*\/ 

#include<iostream.h>  return HEADER1;
#include<stdio.h>  return HEADER2;  
main\(\) return HEADER3;
switch    return SWITCH;
case return CASE;
break return BREAK;
default return DEFAULT;
do    return DO;
while return WHILE;
"cout" return cout;
"<<" return openOut;
"cin" return cin;
">>" return openIn;
"int" return initInt;
"char" return initChar;
"double" return initDouble;
"float" return initFloat;
"{"({digit}",")+"}" ;
"'"{alpha}|{digit}"'" {yylval.value = atoi(yytext); return CHARACTER;}
{digit}+    {yylval.value = atoi(yytext); return NUM;}
{alpha}({alpha}|{digit})*"["{digit}+"]" {yylval.str = strdup(yytext); return arrayID;}
{alpha}({alpha}|{digit})*    {yylval.str = strdup(yytext); return ID;}
\".+\" return STRING;
"<=" return LE;
">=" return GE;
"==" return EQ;
"++" return unP;
"--" return unN;
"||" return OR;
"!=" return NE;
"&&" return AND;
. return yytext[0];
%%


