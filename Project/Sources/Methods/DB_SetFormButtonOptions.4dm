//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetFormButtonOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/08/2010 17:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_CurrentNoButtGrey)
	C_LONGINT:C283($_l_HalfLength)
	C_POINTER:C301(BUT_p_ButtonStringPointer)
	C_TEXT:C284(<>ButtDis; $_t_ButtonOptions; $_t_ButtonOptionsChar1; $_t_oldMethodName; $_t_OptionsString; $1; ButString; vButtDisO)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetFormButtonOptions")

//If (◊NoButtGrey=False)
If (Count parameters:C259=0)
	
	$_t_ButtonOptions:=<>ButtDis
	BUT_p_ButtonStringPointer:=-><>ButtDis
Else 
	$_t_ButtonOptions:=$1
	BUT_p_ButtonStringPointer:=->vButtDisO
End if 


$_t_ButtonOptionsChar1:=Substring:C12($_t_ButtonOptions; 1; 1)
$_t_OptionsString:=""
Case of 
	: (($_t_ButtonOptionsChar1="I") | ($_t_ButtonOptionsChar1="O"))
		WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20)  //Reinsert 6 when start using it
		$_t_OptionsString:=$_t_OptionsString+("03"*Num:C11(Substring:C12($_t_ButtonOptions; 3; 1)="D"))+("04"*Num:C11(Substring:C12($_t_ButtonOptions; 4; 1)="P"))+("05"*Num:C11(Substring:C12($_t_ButtonOptions; 5; 1)="M"))
		If (Substring:C12($_t_ButtonOptions; 6; 1)="O")  //remove this when output layouts are AL
			$_t_OptionsString:=$_t_OptionsString+("06"*Num:C11(Substring:C12($_t_ButtonOptions; 6; 1)="O"))
		End if 
		If (Substring:C12($_t_ButtonOptions; 7; 1)="S")
			$_t_OptionsString:=$_t_OptionsString+"07080910"
		Else 
			If (Substring:C12($_t_ButtonOptions; 7; 1)="N")
				$_t_OptionsString:=$_t_OptionsString+"0810"
			End if 
			If (Substring:C12($_t_ButtonOptions; 8; 1)="P")
				$_t_OptionsString:=$_t_OptionsString+"0709"
			End if 
		End if 
		$_t_OptionsString:=$_t_OptionsString+("11"*Num:C11(Substring:C12($_t_ButtonOptions; 10; 1)="S"))+("12"*Num:C11(Substring:C12($_t_ButtonOptions; 9; 1)="F"))+("13"*Num:C11(Substring:C12($_t_ButtonOptions; 12; 1)="S"))+("14"*Num:C11(Substring:C12($_t_ButtonOptions; 11; 1)="S"))+("1516"*Num:C11(Substring:C12($_t_ButtonOptions; 13; 1)="R"))+("17"*Num:C11(Substring:C12($_t_ButtonOptions; 15; 1)="A"))+("18"*Num:C11(Substring:C12($_t_ButtonOptions; 14; 1)="C"))+("19"*Num:C11(Substring:C12($_t_ButtonOptions; 17; 1)="T"))+("20"*Num:C11(Substring:C12($_t_ButtonOptions; 16; 1)="D"))
		$_l_HalfLength:=Length:C16($_t_OptionsString)/2
		$_t_OptionsString:=$_t_OptionsString+("  "*(20-$_l_HalfLength))
		WS_SETPALLETTEBUTTONS(False:C215; Num:C11(Substring:C12($_t_OptionsString; 1; 2)); Num:C11(Substring:C12($_t_OptionsString; 3; 2)); Num:C11(Substring:C12($_t_OptionsString; 5; 2)); Num:C11(Substring:C12($_t_OptionsString; 7; 2)); Num:C11(Substring:C12($_t_OptionsString; 9; 2)); Num:C11(Substring:C12($_t_OptionsString; 11; 2)); Num:C11(Substring:C12($_t_OptionsString; 13; 2)); Num:C11(Substring:C12($_t_OptionsString; 15; 2)); Num:C11(Substring:C12($_t_OptionsString; 17; 2)); Num:C11(Substring:C12($_t_OptionsString; 19; 2)); Num:C11(Substring:C12($_t_OptionsString; 21; 2)); Num:C11(Substring:C12($_t_OptionsString; 23; 2)); Num:C11(Substring:C12($_t_OptionsString; 25; 2)); Num:C11(Substring:C12($_t_OptionsString; 27; 2)); Num:C11(Substring:C12($_t_OptionsString; 29; 2)); Num:C11(Substring:C12($_t_OptionsString; 31; 2)); Num:C11(Substring:C12($_t_OptionsString; 33; 2)); Num:C11(Substring:C12($_t_OptionsString; 35; 2)); Num:C11(Substring:C12($_t_OptionsString; 37; 2)); Num:C11(Substring:C12($_t_OptionsString; 39; 2)))
		ButString:=$_t_OptionsString
	: ($_t_ButtonOptionsChar1="C")
		//copy mode(output)
		WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 11; 12; 13; 14; 30)  //Reinsert 6 when start using it
	: ($_t_ButtonOptionsChar1="D")
		//copy mode(input)
		WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 11; 12; 13; 14; 30)  //Reinsert 6 when start using it
		
	: ($_t_ButtonOptionsChar1="G")
		
		WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20; 21; 22; 23; 24; 25; 26; 27; 28)  //Reinsert 6 when start using it
	: ($_t_ButtonOptionsChar1="A")
		WS_SETPALLETTEBUTTONS(True:C214; 1; 2)
		WS_SETPALLETTEBUTTONS(False:C215; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20)  //Reinsert 6 when start using it
	: ($_t_ButtonOptionsChar1="M")  //=more choices
		WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 20)
		WS_SETPALLETTEBUTTONS(False:C215; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19)
	: (($_t_ButtonOptionsChar1="U") | ($_t_ButtonOptionsChar1="X"))
		WS_SETPALLETTEBUTTONS(True:C214; 1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20)  //Reinsert 6 when start using it
		If ($_t_ButtonOptionsChar1="X")
			<>PER_bo_CurrentNoButtGrey:=True:C214
		End if 
		
End case 

// CLEAR SEMAPHORE("$ButtDis")
//End if
ERR_MethodTrackerReturn("DB_SetFormButtonOptions"; $_t_oldMethodName)