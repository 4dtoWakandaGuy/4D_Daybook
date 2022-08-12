If (False:C215)
	//object Name: [JOBS]Job_In.Invisible Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JOB_lb_Stages;0)
	//ARRAY TEXT(JOB_at_JobPageTab;0)
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Job_In.Invisible Button1"; Form event code:C388)
If (JOB_at_JobPageTab>1)
	JOB_at_JobPageTab:=JOB_at_JobPageTab-1
End if 

If (JOB_at_JobPageTab#FORM Get current page:C276)
	Case of 
		: (JOB_at_JobPageTab=2)
			If (FORM Get current page:C276>2)
				Jobs_InPrevPage
			End if 
			
			
			
			FORM GOTO PAGE:C247(2)
			OBJECT SET VISIBLE:C603(JOB_lb_Stages; True:C214)
			
		: (JOB_at_JobPageTab=1)
			If (FORM Get current page:C276>1)
				Jobs_InPrevPage
			End if 
			FORM GOTO PAGE:C247(1)
			OBJECT SET VISIBLE:C603(JOB_lb_Stages; True:C214)
			
		: (JOB_at_JobPageTab=3)
			If (FORM Get current page:C276>3)
				Jobs_InPrevPage
			End if 
			Jobs_InLPOI
			FORM GOTO PAGE:C247(3)
			OBJECT SET VISIBLE:C603(JOB_lb_Stages; False:C215)
			
	End case 
	
End if 
ERR_MethodTrackerReturn("OBJ [JOBS].Job_In.Invisible Button1"; $_t_oldMethodName)
