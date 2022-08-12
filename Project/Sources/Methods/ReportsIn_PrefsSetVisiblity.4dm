//%attributes = {}
If (False:C215)
	//Project Method Name:      ReportsIn_PrefsSetVisiblity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: ReportsIn_PrefsSetVisiblity
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(IR_at_EmailPrintOption1;0)
	//ARRAY TEXT(IR_at_EmailPrintOption2;0)
	//ARRAY TEXT(IR_at_EmailPrintOption3;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ReportsIn_PrefsSetVisiblity")

//Added 17/11/08 v631b120i -kmw

Case of 
	: (IR_at_EmailPrintOption1=1)
		OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOption2@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOption3@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOption4@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOptionOth@"; False:C215)
	Else 
		OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOption2@"; True:C214)
		If (IR_at_EmailPrintOption2#3)  //Override displayal of role if not required
			OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOption2Role"; False:C215)
		End if 
		Case of 
			: (IR_at_EmailPrintOption2=1)
				OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOption3@"; False:C215)
				OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOption4@"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOption3@"; True:C214)
				If (IR_at_EmailPrintOption3#4)  //Override displayal of role if not required
					OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOption3Role"; False:C215)
				End if 
				Case of 
					: (IR_at_EmailPrintOption3>=3)
						OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOption4@"; True:C214)
					Else 
						OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOption4@"; False:C215)
				End case 
		End case 
		OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOptionOth@"; True:C214)
End case 

OBJECT SET ENABLED:C1123(*; "oEmailPrintOption8"; False:C215)
//_O_DISABLE BUTTON(IR_at_EmailPrintOption1)  //added kmw 26/11/08 v631b120i (ensure print is always selected for internal reports as my understanding is that we currently havn't added this ability yet)
OBJECT SET VISIBLE:C603(*; "IR_EmailDisabledMessage"; True:C214)
ERR_MethodTrackerReturn("ReportsIn_PrefsSetVisiblity"; $_t_oldMethodName)
