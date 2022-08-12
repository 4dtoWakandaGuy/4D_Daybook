//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ModMidAL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_AutoOut)
	C_POINTER:C301($3; $4; $7)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $5; $6; $8)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ModMidAL")
If ($4->=1)
	If ((Records in selection:C76($3->)>0) | ((vAutoFind) & (<>DB_bo_AutoOut)))
		Open_Pro_Window($1; 4; 3; $7; $8)  //NG May 2004 added form reference parameters
		Gen_Mod2AL($2; $3; $5; $7; $8)
		//NG may 2004 removed some commented lines
		Close_ProWin
		$4->:=0
	Else 
		Gen_None($5; $4)
	End if 
End if 
ERR_MethodTrackerReturn("Gen_ModMidAL"; $_t_oldMethodName)