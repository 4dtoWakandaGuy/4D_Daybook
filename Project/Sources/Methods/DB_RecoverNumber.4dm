//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_RecoverNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $2)
	C_TEXT:C284($_t_oldMethodName; CREATESEM3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_RecoverNumber")
//this method will recover a file number used  in a transaction
//it is called when a transaction is cancelled


If (Count parameters:C259>=2)
	If ($1>0) & ($2>0)
		
		READ ONLY:C145([IDENTIFIERS:16])
		If ([IDENTIFIERS:16]Table_Number:1#$1)
			QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$1)
		End if 
		If (Records in selection:C76([IDENTIFIERS:16])>0)
			If ([IDENTIFIERS:16]Multiple_Numbers:7)
				READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
				QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=$1+9000; *)
				QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94];  & ; [IDENTIFIERS_MULTI_NUMBERS:94]Number:2=$2)
				If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
					If (Check_Locked(->[IDENTIFIERS_MULTI_NUMBERS:94]; 0))
						[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=$1
						DB_SaveRecord(->[IDENTIFIERS_MULTI_NUMBERS:94])
						UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
						READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
					End if 
					
				End if 
				
			Else 
				CreateSem3:="CodeCrSEL"+String:C10($1)
				While (Semaphore:C143(CreateSem3))
					DelayTicks(10)
				End while 
				READ WRITE:C146([IDENTIFIERS:16])
				LOAD RECORD:C52([IDENTIFIERS:16])
				If (Check_Locked(->[IDENTIFIERS:16]; 1))
					If ([IDENTIFIERS:16]Number:2=$2)
						//the number has not moved on further
						[IDENTIFIERS:16]Number:2:=[IDENTIFIERS:16]Number:2-1
						DB_SaveRecord(->[IDENTIFIERS:16])
						UNLOAD RECORD:C212([IDENTIFIERS:16])
					End if 
				End if 
				UNLOAD RECORD:C212([IDENTIFIERS:16])
				READ ONLY:C145([IDENTIFIERS:16])
				CLEAR SEMAPHORE:C144(CreateSem3)
				
			End if 
			
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("DB_RecoverNumber"; $_t_oldMethodName)