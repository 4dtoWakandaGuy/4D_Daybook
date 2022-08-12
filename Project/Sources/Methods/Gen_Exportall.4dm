//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Exportall
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 10:00:51If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; $_l_TableIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Exportall")
Gen_Confirm("Export type"; "Text"; "4d Format")
If (Ok=1)
	
	
	For ($_l_TableIndex; 1; Get last table number:C254)
		If (Is table number valid:C999($_l_TableIndex))
			$_l_Process:=New process:C317("Gen_Export3"; 64000; "Export Data to text"+String:C10($_l_TableIndex); Table name:C256($_l_TableIndex); Char:C90(124); Char:C90(183); (Table name:C256($_l_TableIndex))+".TXT"; $_l_TableIndex)
			
		End if 
	End for 
	
Else 
	TBL_EXPORT
	
End if 
ERR_MethodTrackerReturn("Gen_Exportall"; $_t_oldMethodName)