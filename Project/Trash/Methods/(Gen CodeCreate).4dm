//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_CodeCreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Locked; $_bo_Update)
	C_LONGINT:C283($_l_CallingProcessID; $_l_Index; $_l_MaxNumber; $_l_Process; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $1; $2)
	C_TEXT:C284($_t_Machine; $_t_oldMethodName; $_t_ProcessName; $_t_user; CreateSem)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_CodeCreate")
//Gen_Code Create
//Open window(60;110;100;160;-720)
//$method:="Gen_CodeCreate"
//Modified June 2004 to check if the record(Movement types is already locked so it
//to update it
//Also modified to create 500 numbers instead of 20!
$_l_CallingProcessID:=0
If (Count parameters:C259>=2)
	If (Application type:C494#4D Server:K5:6)
		$_l_CallingProcessID:=$2
		
	End if 
End if 

If (Count parameters:C259>=1)  //Ie if used in the same process
	$_t_ProcessName:=String:C10($1)
Else 
	PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
End if 
CreateSem:="CodeCr"+$_t_ProcessName
If (Not:C34(Semaphore:C143(CreateSem)))  //1
	$_l_ProcessState:=Num:C11($_t_ProcessName)
	If (($_l_ProcessState>999) & ($_l_ProcessState<2000))  //2
		READ ONLY:C145([MOVEMENT_TYPES:60])  //Added NG June 2004
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]MN_Identifier_Number:24=$_l_ProcessState)
		If ([MOVEMENT_TYPES:60]MN_Identifier_Number:24>0)  //3
			$_bo_Locked:=Locked:C147([MOVEMENT_TYPES:60])  //Add NG JUne 2004
			LOCKED BY:C353([MOVEMENT_TYPES:60]; $_l_Process; $_t_user; $_t_Machine; $_t_ProcessName)
			If ($_t_ProcessName="")
				READ WRITE:C146([MOVEMENT_TYPES:60])
				LOAD RECORD:C52([MOVEMENT_TYPES:60])
				If (Check_Locked(->[MOVEMENT_TYPES:60]; 0))
					$_bo_Update:=True:C214
				Else 
					$_bo_Update:=False:C215
				End if 
			Else 
				
				$_bo_Update:=False:C215  //The record is locked
			End if 
			
			READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
			
			If (Records in selection:C76([MOVEMENT_TYPES:60])>0)
				$_l_ProcessTime:=[MOVEMENT_TYPES:60]Number:6-1
			Else 
				$_l_ProcessTime:=[IDENTIFIERS:16]Number:2
			End if 
			$_l_MaxNumber:=500
			For ($_l_Index; 1; $_l_MaxNumber)
				CREATE RECORD:C68([IDENTIFIERS_MULTI_NUMBERS:94])
				[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=$_l_ProcessState
				[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=$_l_ProcessTime+$_l_Index
				SAVE RECORD:C53([IDENTIFIERS_MULTI_NUMBERS:94])
			End for 
			UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
			If ($_bo_Update)
				[MOVEMENT_TYPES:60]Number:6:=$_l_ProcessTime+$_l_MaxNumber
				DB_SaveRecord(->[MOVEMENT_TYPES:60])
			End if 
			
			UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
			READ ONLY:C145([MOVEMENT_TYPES:60])
			CLEAR SEMAPHORE:C144(CreateSem)
			
			$_l_MaxNumber:=$_l_ProcessState+9000
			QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1>9000)
			If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)  //5
				DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
			End if   //e5
			UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
			READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
			
			//Else
			//`UNLOAD RECORD([MOVEMENT TYPES])
			//READ ONLY([MOVEMENT TYPES])
			//CLEAR SEMAPHORE(CreateSem)
			//End if   `4
			
		Else 
			CLEAR SEMAPHORE:C144(CreateSem)
		End if   //3
		
	Else   //cont2
		READ ONLY:C145([IDENTIFIERS:16])
		If ([IDENTIFIERS:16]Table_Number:1#$_l_ProcessState)
			QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=$_l_ProcessState)
		End if 
		If ([IDENTIFIERS:16]Multiple_Numbers:7)  //6
			
			//READ WRITE([FILES])
			$_bo_Locked:=Locked:C147([MOVEMENT_TYPES:60])  //Add NG JUne 2004
			LOCKED BY:C353([MOVEMENT_TYPES:60]; $_l_Process; $_t_user; $_t_Machine; $_t_ProcessName)
			If ($_t_ProcessName="")
				READ WRITE:C146([IDENTIFIERS:16])
				LOAD RECORD:C52([IDENTIFIERS:16])
				
				If (Check_Locked(->[IDENTIFIERS_MULTI_NUMBERS:94]; 0))
					$_bo_Update:=True:C214
				Else 
					$_bo_Update:=False:C215
				End if 
			Else 
				$_bo_Update:=False:C215
			End if 
			
			// If (Not(Locked([FILES])))  `7
			READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
			QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1=[IDENTIFIERS:16]Table_Number:1)  //added NG
			If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
				$_l_ProcessTime:=([IDENTIFIERS_MULTI_NUMBERS:94]Number:2)-1
			Else 
				$_l_ProcessTime:=[IDENTIFIERS:16]Number:2
			End if 
			
			$_l_MaxNumber:=500
			//ARRAY LONGINT($aN;$_l_MaxNumber)
			//ARRAY INTEGER($_at_FieldNames;$_l_MaxNumber)
			For ($_l_Index; 1; $_l_MaxNumber)
				CREATE RECORD:C68([IDENTIFIERS_MULTI_NUMBERS:94])
				[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1:=$_l_ProcessState
				[IDENTIFIERS_MULTI_NUMBERS:94]Number:2:=$_l_ProcessTime+$_l_Index
				SAVE RECORD:C53([IDENTIFIERS_MULTI_NUMBERS:94])
			End for 
			UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
			READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])  //NG
			If ($_bo_Update)
				[IDENTIFIERS:16]Number:2:=$_l_ProcessTime+$_l_MaxNumber
				DB_SaveRecord(->[IDENTIFIERS:16])
				
				
			End if 
			UNLOAD RECORD:C212([IDENTIFIERS:16])
			READ ONLY:C145([IDENTIFIERS:16])
			REDUCE SELECTION:C351([IDENTIFIERS_MULTI_NUMBERS:94]; 0)  //NG
			CLEAR SEMAPHORE:C144(CreateSem)
			$_l_MaxNumber:=$_l_ProcessState+9000
			READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
			QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1>9000)
			If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)  //8
				DELETE SELECTION:C66([IDENTIFIERS_MULTI_NUMBERS:94])
			End if   //e8
			UNLOAD RECORD:C212([IDENTIFIERS_MULTI_NUMBERS:94])
			READ ONLY:C145([IDENTIFIERS_MULTI_NUMBERS:94])
			
		Else   //cont6
			CLEAR SEMAPHORE:C144("CodeCr"+$_t_ProcessName)
		End if   //e6
	End if   //e2
End if   //e1
If (Count parameters:C259>=2)
	RESUME PROCESS:C320($2)
End if 
ERR_MethodTrackerReturn("Gen_CodeCreate"; $_t_oldMethodName)