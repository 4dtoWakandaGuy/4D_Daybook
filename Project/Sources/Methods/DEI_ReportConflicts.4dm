//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_ReportConflicts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 09:10:49If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($b_globaluniqueErrorfound; $b_uniqueErrorfound)
	C_LONGINT:C283($1; $l_fixconflicts; $m_l_tablenumber)
	C_POINTER:C301($m_p_tablePtr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_ReportConflicts")
//$1 ->0 just report non-unique data in unique fields
//1 Report and purge
//2 Report and delete leaving the first record
CONFIRM:C162("Reporting duplicate values from unique fields can take a long time."+" Are you sure you want to continue?")
If (OK=1)
	
	DB_SetAlltriggers(-1)
	
	If (Count parameters:C259>0)
		$l_fixconflicts:=$1
	Else 
		$l_fixconflicts:=0
	End if 
	
	
	For ($m_l_tablenumber; 1; Get last table number:C254)
		If (Is table number valid:C999($m_l_tablenumber))
			
			$m_p_tablePtr:=Table:C252($m_l_tablenumber)
			$b_uniqueErrorfound:=DEI_ReportConflict4Table($m_p_tablePtr; $l_fixconflicts)
			
			If ($b_uniqueErrorfound)
				$b_globaluniqueErrorfound:=$b_uniqueErrorfound
			End if 
		End if 
	End for 
	
	UnloadAllRecords
	
	If ($b_globaluniqueErrorfound)
		ALERT:C41("Error(s) found. See report: "+Document)
	Else 
		ALERT:C41("Data is fine!")
		If (Test path name:C476(Document)=Is a document:K24:1)
			DELETE DOCUMENT:C159(Document)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DEI_ReportConflicts"; $_t_oldMethodName)