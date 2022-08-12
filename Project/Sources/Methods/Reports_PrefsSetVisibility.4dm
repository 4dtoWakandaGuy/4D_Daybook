//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsSetVisibility
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsSetVisibility
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	C_LONGINT:C283($_l_PrintOption1; $_l_PrintOption2; $_l_PrintOption3; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsSetVisibility")

//Added 13/11/08 v631b120g -kmw

If (Count parameters:C259>=1)
	$_l_PrintOption1:=$1
	If (Count parameters:C259>=2)
		$_l_PrintOption2:=$2
		If (Count parameters:C259>=3)
			$_l_PrintOption3:=$3
		Else 
			$_l_PrintOption3:=SR_at_EmailPrintOption3
		End if 
	Else 
		$_l_PrintOption2:=SR_at_EmailPrintOption2
		$_l_PrintOption3:=SR_at_EmailPrintOption3
	End if 
Else 
	$_l_PrintOption1:=SR_at_EmailPrintOption1
	$_l_PrintOption2:=SR_at_EmailPrintOption2
	$_l_PrintOption3:=SR_at_EmailPrintOption3
End if 
Reports_PrefsDeclareDefaults  //added kmw 26/11/08 v631b120i

Case of 
	: ($_l_PrintOption1=1)
		OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption2@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption3@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption4@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oSREmailPrintOptionoth@"; False:C215)
	Else 
		OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption2@"; True:C214)
		If ($_l_PrintOption2#3)  //Override displayal of company role if not required
			OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption2Role"; False:C215)
		End if 
		If ($_l_PrintOption2#6)  //Override displayal of contact if not required
			OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption2Cont"; False:C215)
		End if 
		If ($_l_PrintOption2#7)  //Override displayal of person if not required
			OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption2Pers"; False:C215)
		End if 
		If ($_l_PrintOption2#8)  //Override displayal of person if not required
			OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption2Email"; False:C215)
		End if 
		Case of 
			: ($_l_PrintOption2=1)
				OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption3@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption3@"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption3@"; True:C214)
				If ($_l_PrintOption3#4)  //Override displayal of role if not required
					OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption3Role"; False:C215)
				End if 
				If ($_l_PrintOption3#7)  //Override displayal of role if not required
					OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption3Cont"; False:C215)
				End if 
				If ($_l_PrintOption3#8)  //Override displayal of role if not required
					OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption3Pers"; False:C215)
				End if 
				If ($_l_PrintOption3#9)  //Override displayal of role if not required
					OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption3"; False:C215)
				End if 
				Case of 
					: ($_l_PrintOption3>=3)
						OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption4@"; True:C214)
					Else 
						OBJECT SET VISIBLE:C603(*; "oSREmailPrintOption4@"; False:C215)
				End case 
		End case 
		OBJECT SET VISIBLE:C603(*; "oSREmailPrintOptionOth@"; True:C214)
End case 
ERR_MethodTrackerReturn("Reports_PrefsSetVisibility"; $_t_oldMethodName)
