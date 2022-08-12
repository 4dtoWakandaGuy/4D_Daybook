//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ImportALL
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
	C_BOOLEAN:C305(GEN_bo_Overwrite)
	C_LONGINT:C283($_l_CountProcesses; $_l_CountProcesses2; $_l_Process; $_l_TablesIndex)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(DOCREF)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ImportALL")
Gen_Confirm("Import type"; "Text"; "4d Format")
If (Ok=1)
	Gen_Confirm("Overwrite Existing Data"; "NO"; "Yes")
	If (OK=1)
		GEN_bo_Overwrite:=False:C215
	Else 
		GEN_bo_Overwrite:=True:C214
	End if 
	//$_l_TableNumber:=Table(->[TRANSACTIONS])
	//TRACE
	$_l_CountProcesses:=Count user processes:C343
	For ($_l_TablesIndex; 1; Get last table number:C254)
		If (Is table number valid:C999($_l_TablesIndex))
			If (DOCREF#?00:00:00?)
				$_l_Process:=New process:C317("Gen_Import3"; 64000; "Importing Data"+String:C10($_l_TablesIndex); Table name:C256($_l_TablesIndex); Char:C90(124); Char:C90(183); (Table name:C256($_l_TablesIndex))+".TXT"; $_l_TablesIndex)
				
				
				
				
			End if 
			$_l_CountProcesses2:=Count user processes:C343
			While ($_l_CountProcesses2>($_l_CountProcesses+5))
				DelayTicks(60*10)
			End while 
		End if 
	End for 
	
Else 
	TBL_IMPORT
End if 
ERR_MethodTrackerReturn("Gen_ImportALL"; $_t_oldMethodName)