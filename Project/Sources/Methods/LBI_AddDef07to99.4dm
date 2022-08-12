//%attributes = {}

If (False:C215)
	//Project Method Name:      LBI_AddDef07to99
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_AddDef07to99")

//NG 21/07/06 This method is a replacement for ALArrDef01
$_t_oldMethodName:=ERR_MethodTracker("LBI_AddDef07to99")
Case of 
	: ($1<10)
		LBi_ArrDef07($1)
		
		
	: ($1>9) & ($1<20)
		LBi_ArrDef10($1)
		
	: ($1>19) & ($1<30)
		LBi_ArrDef20($1)
		
	: ($1>29) & ($1<40)
		LBi_ArrDef30($1)
	: ($1=31)
		
	: ($1>39) & ($1<50)
		LBi_ArrDef40($1)
		
		
		
	: ($1>49) & ($1<60)
		LBi_ArrDef50($1)
		
	: ($1>59) & ($1<70)
		LBi_ArrDef60($1)
	: ($1>69) & ($1<80)
		LBi_ArrDef70($1)
	: ($1>79) & ($1<90)
		LBi_ArrDef80($1)
	: ($1>89) & ($1<100)
		LBi_ArrDef90($1)
		
		
End case 
ERR_MethodTrackerReturn("LBI_AddDef07to99"; $_t_oldMethodName)