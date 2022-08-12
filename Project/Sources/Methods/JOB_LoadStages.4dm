//%attributes = {}
If (False:C215)
	//Project Method Name:      JOB_LoadStages
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 20:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JOB_lb_Stages;0)
	//ARRAY LONGINT(AL_l_ModeStage;0)
	//ARRAY POINTER(JOB_aptr_LBStageSettings;0)
	//ARRAY TEXT(JOB_at_ModeStage;0)
	C_BOOLEAN:C305($_bo_ReadOnlyState)
	C_LONGINT:C283($_l_Hour; $_l_Index; $_l_Minutes; $_l_RecordsinSelection; $2)
	C_PICTURE:C286(JOB_pic_StageEditMode)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JOB_LoadStages")
If (Count parameters:C259>=1)
	ARRAY POINTER:C280(JOB_aptr_LBStageSettings; 0)
	If ($1#"")
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=$1)
	End if 
	
	
	$_l_RecordsinSelection:=Records in selection:C76([JOB_STAGES:47])
	If ($_l_RecordsinSelection>0)
		$_bo_ReadOnlyState:=Read only state:C362([JOB_STAGES:47])
		CREATE SET:C116([JOB_STAGES:47]; "$Temp")
		QUERY SELECTION:C341([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52="")
		If (Records in selection:C76([JOB_STAGES:47])>0)
			
			READ WRITE:C146([JOB_STAGES:47])
			
			APPLY TO SELECTION:C70([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52:=String:C10(Gen_Code((Table:C252(->[JOB_STAGES:47]))+255; ->[JOB_STAGES:47]Job_Stage_code:52)))
			
			
		End if 
		USE SET:C118("$Temp")
		
		QUERY SELECTION:C341([JOB_STAGES:47]; [JOB_STAGES:47]B_Actual_Hours:15#?00:00:00?)
		QUERY SELECTION:C341([JOB_STAGES:47]; [JOB_STAGES:47]X_Actual_Hours_Entry:51=0; *)
		QUERY SELECTION:C341([JOB_STAGES:47];  & ; [JOB_STAGES:47]X_actual_Minutes:53=0)
		If (Records in selection:C76([JOB_STAGES:47])>0)
			For ($_l_Index; 1; Records in selection:C76([JOB_STAGES:47]))
				If ([JOB_STAGES:47]B_Actual_Hours:15#?00:00:00?)
					$_l_Minutes:=([JOB_STAGES:47]B_Actual_Hours:15*1)/60
					$_l_Hour:=Int:C8($_l_Minutes/60)
					$_l_Minutes:=$_l_Minutes-($_l_Hour*60)
					[JOB_STAGES:47]X_Actual_Hours_Entry:51:=$_l_Hour
					[JOB_STAGES:47]X_actual_Minutes:53:=$_l_Minutes
				End if 
				NEXT RECORD:C51([JOB_STAGES:47])
			End for 
		End if 
		
		UNLOAD RECORD:C212([JOB_STAGES:47])
		If ($_bo_ReadOnlyState)
			READ ONLY:C145([JOB_STAGES:47])
		End if 
		
		USE SET:C118("$Temp")
		CLEAR SET:C117("$Temp")
	End if 
	LBi_ArrDefFill(->JOB_aptr_LBStageSettings; ->JOB_lb_Stages; ->[JOB_STAGES:47]Job_Stage_code:52; ->[JOBS:26]Job_Code:1; "211111126"; "JobStage_in"; $2; "Job Stages"; "Job Stage")
	
	LBi_LoadSetup(->JOB_aptr_LBStageSettings; "B")
	
	JOB_at_ModeStage:=1
	
	If ([JOBS:26]End_Date:7<Current date:C33(*)) & ([JOBS:26]End_Date:7>!00-00-00!)
		AL_l_ModeStage{1}:=-1  //This prevents the  being put into an edit mode
		JOB_at_ModeStage{1}:="No Edit"
	End if 
	LBi_EditListLay(->JOB_aptr_LBStageSettings; ->JOB_at_ModeStage; ->JOB_pic_StageEditMode; ->AL_l_ModeStage)
	
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
ERR_MethodTrackerReturn("JOB_LoadStages"; $_t_oldMethodName)