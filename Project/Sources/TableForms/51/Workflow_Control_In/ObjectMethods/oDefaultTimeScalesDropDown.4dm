If (False:C215)
	//object Name: [WORKFLOW_CONTROL]Workflow_Control_In.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/10/2010 10:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SEQ_at_Timescales;0)
	C_TEXT:C284($_t_oldMethodName; SEQ_t_TImescale)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.Variable3"; Form event code:C388)
If (SEQ_at_Timescales>0)
	OBJECT SET VISIBLE:C603(*; "oWFDays@"; (SEQ_at_Timescales=1))
	OBJECT SET VISIBLE:C603(*; "oWFHours@"; (SEQ_at_Timescales=2))
	OBJECT SET VISIBLE:C603(*; "oWFMinutes@"; (SEQ_at_Timescales=3))
	
	Case of 
			
		: (SEQ_at_Timescales=1)
			[WORKFLOW_CONTROL:51]Days:4:=Old:C35([WORKFLOW_CONTROL:51]Days:4)
			[WORKFLOW_CONTROL:51]Hours:12:=0
			[WORKFLOW_CONTROL:51]Minutes:13:=0
		: (SEQ_at_Timescales=2)
			[WORKFLOW_CONTROL:51]Hours:12:=Old:C35([WORKFLOW_CONTROL:51]Hours:12)
			[WORKFLOW_CONTROL:51]Minutes:13:=0
			[WORKFLOW_CONTROL:51]Days:4:=0
		: (SEQ_at_Timescales=3)
			[WORKFLOW_CONTROL:51]Minutes:13:=Old:C35([WORKFLOW_CONTROL:51]Minutes:13)
			[WORKFLOW_CONTROL:51]Hours:12:=0
			[WORKFLOW_CONTROL:51]Days:4:=0
	End case 
	//SEQ_t_TImescale:=SEQ_at_Timescales{SEQ_at_Timescales}
	Form:C1466.timescale:=SEQ_at_Timescales{SEQ_at_Timescales}
	SEQ_at_Timescales{0}:=SEQ_at_Timescales{SEQ_at_Timescales}
	SEQ_at_Timescales:=0
	OBJECT SET VISIBLE:C603(*; "oDefaultTimescale"; False:C215)
End if 
ERR_MethodTrackerReturn("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.Variable3"; $_t_oldMethodName)
