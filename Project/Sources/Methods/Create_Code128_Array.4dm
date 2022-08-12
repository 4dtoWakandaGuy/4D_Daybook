//%attributes = {}
If (False:C215)
	//Project Method Name:      Create_Code128_Array
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/08/2009 16:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(BARC_al_Checksums2;0)
	//ARRAY LONGINT(BARC_al_Checksums;0)
	//ARRAY TEXT(BARC_at_Patterns;0)
	//ARRAY TEXT(BARC_at_Patterns2;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Create_Code128_Array")

// creates the need arrays for Code39

ARRAY TEXT:C222(BARC_at_Patterns; 127)
ARRAY TEXT:C222(BARC_at_Patterns2; 127)

If (BARC_at_Patterns{0}#"10100001100")
	
	BARC_at_Patterns{0}:="10100001100"  // NULL char
	ARRAY LONGINT:C221(BARC_al_Checksums; 0)  // used for checksum
	ARRAY INTEGER:C220(BARC_al_Checksums2; 0)  // used for checksum
	Set_Barcode_Pattern(Character code:C91(" "); "11011001100")  // CodeB = CodeA, no 3rd parameter
	Set_Barcode_Pattern(Character code:C91("!"); "11001101100")
	Set_Barcode_Pattern(Character code:C91("\""); "11001100110")
	Set_Barcode_Pattern(Character code:C91("#"); "10010011000")
	Set_Barcode_Pattern(Character code:C91("$"); "10010001100")
	Set_Barcode_Pattern(Character code:C91("%"); "10001001100")
	Set_Barcode_Pattern(Character code:C91("&"); "10011001000")
	Set_Barcode_Pattern(Character code:C91("'"); "10011000100")
	Set_Barcode_Pattern(Character code:C91("("); "10001100100")
	Set_Barcode_Pattern(Character code:C91(")"); "11001001000")
	Set_Barcode_Pattern(Character code:C91("*"); "11001000100")
	Set_Barcode_Pattern(Character code:C91("+"); "11000100100")
	Set_Barcode_Pattern(Character code:C91(","); "10110011100")
	Set_Barcode_Pattern(Character code:C91("-"); "10011011100")
	Set_Barcode_Pattern(Character code:C91("."); "10011001110")
	Set_Barcode_Pattern(Character code:C91("/"); "10111001100")
	Set_Barcode_Pattern(Character code:C91("0"); "10011101100")
	Set_Barcode_Pattern(Character code:C91("1"); "10011100110")
	Set_Barcode_Pattern(Character code:C91("2"); "11001110010")
	Set_Barcode_Pattern(Character code:C91("3"); "11001011100")
	Set_Barcode_Pattern(Character code:C91("4"); "11001001110")
	Set_Barcode_Pattern(Character code:C91("5"); "11011100100")
	Set_Barcode_Pattern(Character code:C91("6"); "11001110100")
	Set_Barcode_Pattern(Character code:C91("7"); "11101101110")
	Set_Barcode_Pattern(Character code:C91("8"); "11101001100")
	Set_Barcode_Pattern(Character code:C91("9"); "11100101100")
	Set_Barcode_Pattern(Character code:C91(":"); "11100100110")
	Set_Barcode_Pattern(Character code:C91(";"); "11101100100")
	Set_Barcode_Pattern(Character code:C91("<"); "11100110100")
	Set_Barcode_Pattern(Character code:C91("="); "11100110010")
	Set_Barcode_Pattern(Character code:C91(">"); "11011011000")
	Set_Barcode_Pattern(Character code:C91("?"); "11011000110")
	Set_Barcode_Pattern(Character code:C91("@"); "11000110110")
	Set_Barcode_Pattern(Character code:C91("A"); "10100011000")
	Set_Barcode_Pattern(Character code:C91("B"); "10001011000")
	Set_Barcode_Pattern(Character code:C91("C"); "10001000110")
	Set_Barcode_Pattern(Character code:C91("D"); "10110001000")
	Set_Barcode_Pattern(Character code:C91("E"); "10001101000")
	Set_Barcode_Pattern(Character code:C91("F"); "10001100010")
	Set_Barcode_Pattern(Character code:C91("G"); "11010001000")
	Set_Barcode_Pattern(Character code:C91("H"); "11000101000")
	Set_Barcode_Pattern(Character code:C91("I"); "11000100010")
	Set_Barcode_Pattern(Character code:C91("J"); "10110111000")
	Set_Barcode_Pattern(Character code:C91("K"); "10110001110")
	Set_Barcode_Pattern(Character code:C91("L"); "10001101110")
	Set_Barcode_Pattern(Character code:C91("M"); "10111011000")
	Set_Barcode_Pattern(Character code:C91("N"); "10111000110")
	Set_Barcode_Pattern(Character code:C91("O"); "10001110110")
	Set_Barcode_Pattern(Character code:C91("P"); "11101110110")
	Set_Barcode_Pattern(Character code:C91("Q"); "11010001110")
	Set_Barcode_Pattern(Character code:C91("R"); "11000101110")
	Set_Barcode_Pattern(Character code:C91("S"); "11011101000")
	Set_Barcode_Pattern(Character code:C91("T"); "11011100010")
	Set_Barcode_Pattern(Character code:C91("U"); "11011101110")
	Set_Barcode_Pattern(Character code:C91("V"); "11101011000")
	Set_Barcode_Pattern(Character code:C91("W"); "11101000110")
	Set_Barcode_Pattern(Character code:C91("X"); "11100010110")
	Set_Barcode_Pattern(Character code:C91("Y"); "11101101000")
	Set_Barcode_Pattern(Character code:C91("Z"); "11101100010")
	Set_Barcode_Pattern(Character code:C91("["); "11100011010")
	Set_Barcode_Pattern(Character code:C91("\\"); "11101111010")
	Set_Barcode_Pattern(Character code:C91("]"); "11001000010")
	Set_Barcode_Pattern(Character code:C91("^"); "11110001010")
	Set_Barcode_Pattern(Character code:C91("_"); "10100110000")
	Set_Barcode_Pattern(0; "10100001100"; Character code:C91("`"))
	Set_Barcode_Pattern(1; "10010110000"; Character code:C91("a"))
	Set_Barcode_Pattern(2; "10010000110"; Character code:C91("b"))
	Set_Barcode_Pattern(3; "10000101100"; Character code:C91("c"))
	Set_Barcode_Pattern(4; "10000100110"; Character code:C91("d"))
	Set_Barcode_Pattern(5; "10110010000"; Character code:C91("e"))
	Set_Barcode_Pattern(6; "10110000100"; Character code:C91("f"))
	Set_Barcode_Pattern(7; "10110000100"; Character code:C91("g"))
	Set_Barcode_Pattern(8; "10011000010"; Character code:C91("h"))
	Set_Barcode_Pattern(9; "10000110100"; Character code:C91("i"))
	Set_Barcode_Pattern(10; "10000110010"; Character code:C91("j"))
	Set_Barcode_Pattern(11; "11000010010"; Character code:C91("k"))
	Set_Barcode_Pattern(12; "11001010000"; Character code:C91("l"))
	Set_Barcode_Pattern(13; "11110111010"; Character code:C91("m"))
	Set_Barcode_Pattern(14; "11000010100"; Character code:C91("n"))
	Set_Barcode_Pattern(15; "10001111010"; Character code:C91("o"))
	Set_Barcode_Pattern(16; "10100111100"; Character code:C91("p"))
	Set_Barcode_Pattern(17; "10010111100"; Character code:C91("q"))
	Set_Barcode_Pattern(18; "10010011110"; Character code:C91("r"))
	Set_Barcode_Pattern(19; "10111100100"; Character code:C91("s"))
	Set_Barcode_Pattern(20; "10011110100"; Character code:C91("t"))
	Set_Barcode_Pattern(21; "10011110010"; Character code:C91("u"))
	Set_Barcode_Pattern(22; "11110100100"; Character code:C91("v"))
	Set_Barcode_Pattern(23; "11110010100"; Character code:C91("w"))
	Set_Barcode_Pattern(24; "11110010010"; Character code:C91("x"))
	Set_Barcode_Pattern(25; "11011011110"; Character code:C91("y"))
	Set_Barcode_Pattern(26; "11011110110"; Character code:C91("z"))
	Set_Barcode_Pattern(27; "11110110110"; Character code:C91("{"))
	Set_Barcode_Pattern(28; "10101111000"; Character code:C91("|"))
	Set_Barcode_Pattern(29; "10100011110"; Character code:C91("}"))
	Set_Barcode_Pattern(30; "10001011110"; Character code:C91("~"))
	Set_Barcode_Pattern(31; "10111101000"; 127)
	Set_Barcode_Pattern(101; "10111100010"; 1)  // this code is only needed for CodeC, if you need FNC3 you can use it
	Set_Barcode_Pattern(102; "11110101000"; 2)
	Set_Barcode_Pattern(103; "11110100010"; 3)
	Set_Barcode_Pattern(104; "10111011110"; 4)  // use this code for CodeC Switch
	Set_Barcode_Pattern(105; "10111101110"; 5)  // CodeB switch
	Set_Barcode_Pattern(106; "11101011110"; 6)  // codeA
	Set_Barcode_Pattern(107; "11110101110"; 7)  // FNC1
	Set_Barcode_Pattern(108; "11010000100"; 8)  // Startcode for codeA
	Set_Barcode_Pattern(109; "11010010000"; 9)  // Start CodeB
	Set_Barcode_Pattern(110; "11010011100"; 10)  // Start CodeC
	Set_Barcode_Pattern(111; "1100011101011"; 11)  // Stop Code
	
End if 
ERR_MethodTrackerReturn("Create_Code128_Array"; $_t_oldMethodName)