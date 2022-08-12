//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_GetCharges
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_offset)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>SYS_ti_DefaultTimeUnits; CON_ti_TimeUnit)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_GetCharges")
//NG April 2004
//this new method will unpack the blob [CONTACTS]xChargeOutRates
//Into 3 arrays passed in parameters 1,2,3 as pointers
If (Count parameters:C259>=3)
	ARRAY TEXT:C222($1->; 0)  //to hold the roles
	ARRAY REAL:C219($2->; 0)  //to hold the Sales Rate
	ARRAY REAL:C219($3->; 0)  //To hold the Cost Rate
	CON_ti_TimeUnit:=<>SYS_ti_DefaultTimeUnits
	//I am copying this variable
	//this is so we can change this and have a charging unit for this contact
	//
	$_l_offset:=0
	If (BLOB size:C605([CONTACTS:1]x_Charge_Out_Rates:36)>0)
		BLOB TO VARIABLE:C533([CONTACTS:1]x_Charge_Out_Rates:36; $1->; $_l_offset)
		If (BLOB size:C605([CONTACTS:1]x_Charge_Out_Rates:36)>$_l_offset)
			BLOB TO VARIABLE:C533([CONTACTS:1]x_Charge_Out_Rates:36; $2->; $_l_offset)
			If (BLOB size:C605([CONTACTS:1]x_Charge_Out_Rates:36)>$_l_offset)
				BLOB TO VARIABLE:C533([CONTACTS:1]x_Charge_Out_Rates:36; $3->; $_l_offset)
			End if 
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("CON_GetCharges"; $_t_oldMethodName)