//%attributes = {}
If (False:C215)
	//Project Method Name:      JST_LoadPersons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JST_LB_Persons;0)
	//ARRAY POINTER(JST_aptr_LBSettings;0)
	C_BOOLEAN:C305($_bo_ReadOnlyState)
	C_LONGINT:C283($_l_RecordsInSelection)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JST_LoadPersons")

If (Count parameters:C259>=1)
	ARRAY POINTER:C280(JST_aptr_LBSettings; 0)
	If ($1#"")
		QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_stage_Code:17=$1)
		CREATE SET:C116([JOB PERSONNEL:48]; "$JobPersonnelSet")
		QUERY SELECTION:C341([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Personnel_Code:18="")
		If (Records in selection:C76([JOB PERSONNEL:48])>0)
			$_bo_ReadOnlyState:=Read only state:C362([JOB PERSONNEL:48])
			If ($_bo_ReadOnlyState)
				READ WRITE:C146([JOB PERSONNEL:48])
			End if 
			USE SET:C118("$JobPersonnelSet")
			QUERY SELECTION:C341([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Personnel_Code:18="")
			APPLY TO SELECTION:C70([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Personnel_Code:18:=String:C10(Gen_Code(Table:C252(->[JOB PERSONNEL:48])+255; ->[JOB PERSONNEL:48]Job_Personnel_Code:18)))
			If ($_bo_ReadOnlyState)
				READ ONLY:C145([JOB PERSONNEL:48])
			End if 
			QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_stage_Code:17=[JOB_STAGES:47]Job_Stage_code:52)
		Else 
			USE SET:C118("$JobPersonnelSet")
		End if 
		
		CLEAR SET:C117("$JobPersonnelSet")
		
	Else 
		REDUCE SELECTION:C351([JOB PERSONNEL:48]; 0)
		
	End if 
	
	$_l_RecordsInSelection:=Records in selection:C76([JOB PERSONNEL:48])
	//
	//
	LBi_ArrDefFill(->JST_aptr_LBSettings; ->JST_LB_Persons; ->[JOB PERSONNEL:48]Job_Personnel_Code:18; ->[JOB_STAGES:47]Job_Stage_code:52; "411111126"; "JobPers_in"; 1; "Job Personnel"; "Job Personnel")
	
	LBi_LoadSetup(->JST_aptr_LBSettings; "B")
	
	//Default fields are.
	//Stage code
	//stage name
	//bactual hours
	//AT actualhours
	//bclient rate
	//as quoted  am
	//bapplic Rate
	//At bud sales AM
	//VatCode
	
End if 
ERR_MethodTrackerReturn("JST_LoadPersons"; $_t_oldMethodName)