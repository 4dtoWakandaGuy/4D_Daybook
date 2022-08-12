//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_UnitTextConfirmation
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
	//ARRAY TEXT(<>DB_at_TestedFunctions;0)
	C_BOOLEAN:C305(<>DB_bo_TestingProblem; <>DB_bo_TestModeInited; <>Email_bo_PersonInited; $_bo_EmailSent; DB_bo_NoEmailInfo; DB_bo_TestingConfinprogresss)
	C_LONGINT:C283(<>DB_l_TestingMode; $_l_FunctionRow; $_l_Index; $_l_Process; $_l_ProcessState; $_l_ProcessTime; $_l_SizeofArray)
	C_REAL:C285(<>DB_l_FirstElement)
	C_TEXT:C284(<>Per_at_PersonnelNames_EmailFrom; <>PER_t_CurrentEmailFrom; <>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; $_t_EmailAttachment; $_t_EmailData; $_t_EmailID; $_t_EmailSentTo; $_t_EmailText; $_t_oldMethodName; $_t_ProcessName)
	C_TEXT:C284($1; $2; EMAIL_t_EmailTo; EMAIL_t_SendCalledFrom; EmailAddress)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_UnitTextConfirmation")

//$_t_oldMethodName:=ERR_MethodTracker ("DB_UnitTextConfirmation")

If (False:C215)
	
	
	
	<>DB_l_TestingMode:=1
	
	If (<>DB_l_TestingMode=1) & (Not:C34(<>DB_bo_TestingProblem))
		
		
		If (Not:C34(<>DB_bo_TestModeInited))
			
			ARRAY TEXT:C222(<>DB_at_TestedFunctions; 0)
			
			
			<>DB_bo_TestModeInited:=True:C214
			<>DB_l_FirstElement:=1
		End if 
		$_l_Process:=Current process:C322
		PROCESS PROPERTIES:C336($_l_Process; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
		While (Semaphore:C143("Apendtestarray"))
			DelayTicks
		End while 
		If (Count parameters:C259>=2)
			
			
			$_l_FunctionRow:=Find in array:C230(<>DB_at_TestedFunctions; "Method: "+Char:C90(Tab:K15:37)+$1+Char:C90(Tab:K15:37)+" Process:"+Char:C90(Tab:K15:37)+$_t_ProcessName+Char:C90(Tab:K15:37)+"Settings: "+Char:C90(Tab:K15:37)+$2)
		Else 
			$_l_FunctionRow:=Find in array:C230(<>DB_at_TestedFunctions; "Method: "+Char:C90(Tab:K15:37)+$1+Char:C90(Tab:K15:37)+" Process:"+Char:C90(Tab:K15:37)+$_t_ProcessName)
		End if 
		If ($_l_FunctionRow<0)
			
			
			
			$_l_Process:=Current process:C322
			PROCESS PROPERTIES:C336($_l_Process; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			
			If (Count parameters:C259>=2)
				APPEND TO ARRAY:C911(<>DB_at_TestedFunctions; "Method: "+Char:C90(Tab:K15:37)+$1+Char:C90(Tab:K15:37)+" Process:"+Char:C90(Tab:K15:37)+$_t_ProcessName+Char:C90(Tab:K15:37)+"Settings: "+Char:C90(Tab:K15:37)+$2)
			Else 
				
				APPEND TO ARRAY:C911(<>DB_at_TestedFunctions; "Method: "+Char:C90(Tab:K15:37)+$1+Char:C90(Tab:K15:37)+" Process:"+Char:C90(Tab:K15:37)+$_t_ProcessName)
			End if 
			
			CLEAR SEMAPHORE:C144("Apendtestarray")
			
			
			
			
			
			If (<>Email_bo_PersonInited) & (Not:C34(DB_bo_TestingConfinprogresss))
				While (Semaphore:C143("Apendtestarray"))
					DelayTicks
				End while 
				If (Size of array:C274(<>DB_at_TestedFunctions)>(<>DB_l_FirstElement+100)) | (DB_bo_OnExit)
					
					
					
					DB_bo_TestingConfinprogresss:=True:C214  //to prevent recursive calls
					//TRACE
					$_t_EmailSentTo:="To"
					EMAIL_t_EmailTo:="Daybook Unit testing"
					EmailAddress:="nigel.greenlee@cleardaysoftware.com"
					$_t_EmailAttachment:=""
					$_bo_EmailSent:=False:C215
					$_t_EmailData:=""
					DB_bo_NoEmailInfo:=True:C214
					$_l_SizeofArray:=Size of array:C274(<>DB_at_TestedFunctions)
					For ($_l_Index; <>DB_l_FirstElement; $_l_SizeofArray)
						$_t_EmailData:=$_t_EmailData+<>DB_at_TestedFunctions{$_l_Index}+Char:C90(13)
					End for 
					<>DB_l_FirstElement:=$_l_SizeofArray
					$_t_EmailText:=DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$_t_EmailData+Char:C90(13)
					If (<>DB_l_FirstElement>32000)  //I was setting this back all the time but getting too many repeated values. I want to cut down
						ARRAY TEXT:C222(<>DB_at_TestedFunctions; 0)
						<>DB_l_FirstElement:=1
					End if 
					EMAIL_t_SendCalledFrom:="DB_UnitTextConfirmation"
					$_t_EmailID:=Email_Send(->$_t_EmailSentTo; ->EMAIL_t_EmailTo; ->EmailAddress; <>PER_t_CurrentUserName; <>PER_t_CurrentEmailFrom; <>Per_at_PersonnelNames_EmailFrom; "Daybook unit test"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
					If ($_t_EmailID="")
						<>DB_bo_TestingProblem:=True:C214
					End if 
					DB_bo_TestingConfinprogresss:=False:C215
					
				End if 
				
			Else 
				
			End if 
			
		End if 
		CLEAR SEMAPHORE:C144("Apendtestarray")
	End if 
End if 
//ERR_MethodTrackerReturn ("DB_UnitTextConfirmation";$_t_oldMethodName)