//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check LockMess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; IME_bo_FromWebRequest)
	C_LONGINT:C283(<>Repeat; $_l_Process; $_l_Time; $processNumber)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_MachineName; $_t_oldMethodName; $_t_ProcessName; $_t_user; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check LockMess")

IME_WebMessagesInit


If (IME_bo_FromWebRequest=False:C215)
	If (Check_Locked($1; 1))
		$0:=True:C214
		OK:=1
	Else 
		LOCKED BY:C353($1->; $_l_Process; $_t_user; $_t_MachineName; $_t_ProcessName)
		If ($_t_user="") & ($_t_MachineName="")
			//single user system
			Gen_Confirm("A "+$2+" is locked by "+$_t_ProcessName+Char:C90(13)+Char:C90(13)+"Continue waiting?"; "Yes"; "No")
			If (OK=1)
				$processNumber:=Process number:C372($_t_ProcessName)
				If ($processNumber#Current process:C322)
					HIDE PROCESS:C324(Current process:C322)
					
					SHOW PROCESS:C325($processNumber)
					BRING TO FRONT:C326($processNumber)
					DelayTicks(60*6)
					SHOW PROCESS:C325(Current process:C322)
					BRING TO FRONT:C326(Current process:C322)
					
				End if 
			End if 
		Else 
			If ($_t_MachineName=Current machine:C483)
				Gen_Confirm("A "+$2+" is locked by "+$_t_ProcessName+Char:C90(13)+Char:C90(13)+"Continue waiting?"; "Show"; "No")
				If (OK=1)
					$processNumber:=Process number:C372($_t_ProcessName)
					If ($processNumber#Current process:C322)
						HIDE PROCESS:C324(Current process:C322)
						
						SHOW PROCESS:C325($processNumber)
						BRING TO FRONT:C326($processNumber)
						DelayTicks(60*60)
						SHOW PROCESS:C325(Current process:C322)
						BRING TO FRONT:C326(Current process:C322)
						
					End if 
				End if 
			Else 
				Gen_Confirm("A "+$2+" is locked by "+$_t_user+" on machine "+$_t_MachineName+Char:C90(13)+Char:C90(13)+"Continue waiting?"; "Yes"; "No")
			End if 
		End if 
		If (OK=1)
			$0:=Check LockMess($1; $2)
		Else 
			$0:=False:C215
			OK:=0
		End if 
	End if 
Else   //added 26/02/08
	$0:=True:C214  //added 26/02/08
	$_l_Time:=2
	OK:=1  //added 26/02/08
	If (Count parameters:C259>1)  //added 26/02/08
		If (Check_Locked($1; $_l_Time)=False:C215)  //added 26/02/08
			DelayTicks(60)  //added 26/02/08
			If (Check_Locked($1; $_l_Time)=False:C215)  //added 26/02/08
				DelayTicks(60)  //added 26/02/08
				If (Check_Locked($1; $_l_Time)=False:C215)  //added 26/02/08
					IME_WebMessagesAddError("Record Locked"; "Sorry. Record in Table '"+Table name:C256($1)+"' is Locked.")
					OK:=0
					$0:=False:C215
				End if   //added 26/02/08
			End if   //added 26/02/08
		Else   //added 26/02/08
			If (Check_Locked($1; 1)=False:C215)  //added 26/02/08
				DelayTicks(60)  //added 26/02/08
				If (Check_Locked($1; 1)=False:C215)  //added 26/02/08
					DelayTicks(60)  //added 26/02/08
					If (Check_Locked($1; 1)=False:C215)  //added 26/02/08
						IME_WebMessagesAddError("Record Locked"; "Sorry. Record in Table '"+Table name:C256($1)+"' is Locked.")
						OK:=0
						$0:=False:C215
					End if   //added 26/02/08
				End if   //added 26/02/08
			End if   //added 26/02/08
		End if   //added 26/02/08
	End if   //added 26/02/08
End if 
ERR_MethodTrackerReturn("Check LockMess"; $_t_oldMethodName)