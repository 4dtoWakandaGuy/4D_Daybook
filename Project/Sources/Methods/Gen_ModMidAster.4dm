//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ModMidAster
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
	C_LONGINT:C283(vNo)
	C_POINTER:C301($3; $4)
	C_TEXT:C284($_t_FormReference; $_t_oldMethodName; $1; $2; $5; $6; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ModMidAster")
If ($4->=1)
	If ((Records in selection:C76($3->)>0) | ((vAutoFind) & (<>DB_bo_AutoOut)))
		CREATE SET:C116($3->; $2)
		CREATE EMPTY SET:C140($3->; "Userset")
		vNo:=Records in selection:C76($3->)
		If ($6#"")
			DB_t_CurrentFormUsage:=$6
		End if 
		$_t_FormReference:=""  //NG added May 2004
		If ((vAutoFind) & (<>DB_bo_AutoOut))
			Open_Pro_Window($1; 0; 2; $3; $5)  //NG may 2004 added form references
			$_t_FormReference:=Table name:C256($3)+"_"+$5  //Added NG may 2004
			
			Gen_ModMidAP($2; $3; $5)
		Else 
			Open_Pro_Window($1; 0; 1; $3; WIN_t_CurrentOutputform)
			Gen_Mod2($2; $3; $5)
		End if 
		If ($_t_FormReference#"")  //NG added May 2004
			Close_ProWin($_t_FormReference)  //NG added May 2004
		Else 
			Close_ProWin
		End if 
		
		$4->:=0
	Else 
		Gen_None($5; $4)
	End if 
End if 
ERR_MethodTrackerReturn("Gen_ModMidAster"; $_t_oldMethodName)