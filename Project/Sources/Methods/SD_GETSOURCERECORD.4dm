//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_GETSOURCERECORD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/03/2011 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ButtonClickedFunction; $_l_IPMessage; $_l_ProcessState; $_l_ProcessTime; $_l_Repeats; $1; $2; DB_l_ButtonClickedFunction; IP_l_MessageReply)
	C_TEXT:C284($_t_MessageReplySTR; $_t_oldMethodName; $_t_ProcessName; IP_t_MessageReplySTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GETSOURCERECORD")
//THIS METHOD WILL GET THE RECORD NO INTO THE CORRECT FIELDS ON THE DIARY
IP_t_MessageReplySTR:=""
If (Count parameters:C259>=2)
	If ($1>0) & ($2>0)
		$_l_Repeats:=0
		Repeat   //to make sure nobody else is calling it
			GET PROCESS VARIABLE:C371($1; DB_l_ButtonClickedFunction; $_l_ButtonClickedFunction)
			
			$_l_Repeats:=$_l_Repeats+1
			If ($_l_ButtonClickedFunction>0)
				DelayTicks(2)
			End if 
		Until ($_l_Repeats>100) | ($_l_ButtonClickedFunction=0)
		If ($_l_ButtonClickedFunction=0)  //nobody was calling
			$_l_IPMessage:=DB_GetButtonFunction("GetRecordCode")
			
			PROCESS PROPERTIES:C336($1; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			If ($_l_ProcessState>=0)  // 29/05/02
				
				SET PROCESS VARIABLE:C370($1; IP_t_MessageReplySTR; IP_t_MessageReplySTR)
				
				SET PROCESS VARIABLE:C370($1; DB_l_ButtonClickedFunction; $_l_IPMessage)
				RESUME PROCESS:C320($1)
				//     Delayticks(30)  `bsw 25/05/04 SO not being copied to dia
				POST OUTSIDE CALL:C329($1)
			End if 
			$_l_Repeats:=0
			Repeat 
				GET PROCESS VARIABLE:C371($1; IP_t_MessageReplySTR; $_t_MessageReplySTR)
				$_l_Repeats:=$_l_Repeats+1
				If ($_t_MessageReplySTR="")
					DelayTicks(2)
				End if 
			Until ($_l_Repeats>100) | ($_t_MessageReplySTR#"")
			//the IP_l_MessageReply will now be set to the table number
			If ($_t_MessageReplySTR#"")
				
				
				PROCESS PROPERTIES:C336($1; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
				If ($_l_ProcessState>=0)  // 29/05/02
					SET PROCESS VARIABLE:C370($1; DB_l_ButtonClickedFunction; 0)
				End if 
				Case of 
					: ($2=Table:C252(->[ORDERS:24]))
						// If ([DIARY]Order Code="")    `bsw 25/05/04
						If ([DIARY:12]Order_Code:26="") | ([DIARY:12]Order_Code:26#IP_t_MessageReplySTR)  //bsw 25/05/04
							[DIARY:12]Order_Code:26:=IP_t_MessageReplySTR
							Diary_InLPX(->[DIARY:12]Order_Code:26)
						End if 
					: ($2=Table:C252(->[JOBS:26]))
						If ([DIARY:12]Job_Code:19="")
							[DIARY:12]Job_Code:19:=IP_t_MessageReplySTR
							Diary_InLPX(->[DIARY:12]Job_Code:19)
						End if 
					: ($2=Table:C252(->[JOB_STAGES:47]))
						If ([DIARY:12]Stage_Code:21="")
							[DIARY:12]Stage_Code:21:=IP_t_MessageReplySTR
							Diary_InLPX(->[DIARY:12]Stage_Code:21)
						End if 
						If ([DIARY:12]Job_Code:19="")
							//``````
							IP_t_MessageReplySTR:=""
							$_l_Repeats:=0
							Repeat   //to make sure nobody else is calling it
								GET PROCESS VARIABLE:C371($1; DB_l_ButtonClickedFunction; $_l_ButtonClickedFunction)
								$_l_Repeats:=$_l_Repeats+1
								If ($_l_ButtonClickedFunction>0)
									DelayTicks(2)
								End if 
							Until ($_l_Repeats>100) | ($_l_ButtonClickedFunction=0)
							If (DB_l_ButtonClickedFunction=0)  //nobody was calling
								$_l_IPMessage:=DB_GetButtonFunction("Get Company Code")
								PROCESS PROPERTIES:C336($1; $_t_processName; $_l_ProcessState; $_l_ProcessTime)
								If ($_l_ProcessState>=0)  // 29/05/02
									SET PROCESS VARIABLE:C370($1; DB_l_ButtonClickedFunction; $_l_IPMessage)
									RESUME PROCESS:C320($1)
									POST OUTSIDE CALL:C329($1)
								End if 
								$_l_Repeats:=0
								Repeat 
									GET PROCESS VARIABLE:C371($1; IP_t_MessageReplySTR; IP_t_MessageReplySTR)
									$_l_Repeats:=$_l_Repeats+1
									If (IP_t_MessageReplySTR="")
										DelayTicks(2)
									End if 
								Until ($_l_Repeats>100) | (IP_t_MessageReplySTR#"")
								If (IP_t_MessageReplySTR#"")
									[DIARY:12]Job_Code:19:=IP_t_MessageReplySTR
									Diary_InLPX(->[DIARY:12]Job_Code:19)
								End if 
								IP_t_MessageReplySTR:=""
							End if 
							
							
							//`````
						End if 
						
						
					: ($2=Table:C252(->[PRODUCTS:9]))
						If ([DIARY:12]Product_Code:13="")
							[DIARY:12]Product_Code:13:=IP_t_MessageReplySTR
							Diary_InLPX(->[DIARY:12]Product_Code:13)
						End if 
					: ($2=Table:C252(->[SERVICE_CALLS:20]))
						If ([DIARY:12]Call_Code:25="")
							[DIARY:12]Call_Code:25:=IP_t_MessageReplySTR
							Diary_InLPX(->[DIARY:12]Call_Code:25)
						End if 
						
				End case 
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SD_GETSOURCERECORD"; $_t_oldMethodName)
