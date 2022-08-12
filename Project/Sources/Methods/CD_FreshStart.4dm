//%attributes = {}

If (False:C215)
	//Project Method Name:      CD_FreshStart
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
	C_BOOLEAN:C305(<>DB_bo_NoServicesPlease; CS_bo_ImportFromDaybook)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CD_FreshStart")

//$_t_oldMethodName:=ERR_MethodTracker ("CD_FreshStart")
Open window:C153((Screen width:C187/2)-(500/2); (Screen height:C188/2)-(340/2); (Screen width:C187/2)+(500/2); (Screen height:C188/2)+(340/2); 1)

DIALOG:C40([COMPANIES:2]; "dAsk_StartImp")

If (OK=1)
	CLOSE WINDOW:C154
	If (CS_bo_ImportFromDaybook)
		<>DB_bo_NoServicesPlease:=True:C214
		DB_SetAlltriggers(-1)
		If ((Macintosh option down:C545) | (Windows Alt down:C563))
			If (False:C215)
				TBI_ImportFrom2004
			Else 
				TBL_ImportFrom2004_2
			End if 
			
		Else 
			TBL_IMPORT
		End if 
		<>DB_bo_NoServicesPlease:=True:C214
	Else 
		//do somthing else
	End if 
Else 
	QUIT 4D:C291
End if 
CLOSE WINDOW:C154
ERR_MethodTrackerReturn("CD_FreshStart"; $_t_oldMethodName)